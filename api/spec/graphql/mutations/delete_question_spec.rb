# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deleteQuestion', type: :graphql do
  let(:mutation) do
    <<-GRAPHQL
    mutation DeleteQuestionMutation($id: ID!) {
      deleteQuestion(id: $id) {
        question {
          body
        }
      }
    }
    GRAPHQL
  end
  let(:author) { create(:author) }
  let(:tags) { create_list(:tag, 3) }
  let(:question) { create(:question, author: author) }
  let(:variables) do
    {
      id: question.id
    }
  end

  context 'current_user is not defined' do
    let(:result) do
      {
        data: {
          deleteQuestion: nil
        },
        errors: [
          {
            extensions: {
              code: 'UNAUTHORIZED',
              details: {},
              fullMessages: []
            },
            locations: [
              { column: 7, line: 2 }
            ],
            message: 'You are not authorized to perform this action',
            path: ['deleteQuestion']
          }
        ]
      }
    end

    it { is_expected.to eql result }
  end

  context 'current_user is a user' do
    let(:current_user) { create(:user) }

    let(:result) do
      {
        data: {
          deleteQuestion: nil
        },
        errors: [
          {
            extensions: {
              code: 'UNAUTHORIZED',
              details: {},
              fullMessages: []
            },
            locations: [
              { column: 7, line: 2 }
            ],
            message: 'You are not authorized to perform this action',
            path: ['deleteQuestion']
          }
        ]
      }
    end

    it { is_expected.to eql result }
  end

  context 'current_user is author' do
    let(:current_user) { author }
    let(:result) do
      {
        data: {
          deleteQuestion: {
            question: {
              body: question.body,
            }
          }
        }
      }
    end

    it { is_expected.to eql result }
  end
end
