# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'updateQuestion', type: :graphql do
  let(:mutation) do
    <<-GRAPHQL
    mutation UpdateQuestionMutation($id: ID!, $input: UpdateQuestionInput!) {
      updateQuestion(id: $id, input: $input) {
        question {
          body
          tags {
            id
            name
          }
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
      id: question.id,
      input: {
        body: question.body,
        tagIds: tags.map(&:id)
      }
    }
  end

  context 'current_user is not defined' do
    let(:result) do
      {
        data: {
          updateQuestion: nil
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
            path: ['updateQuestion']
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
          updateQuestion: nil
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
            path: ['updateQuestion']
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
          updateQuestion: {
            question: {
              body: question.body,
              tags: tags.map { |tag| { id: tag.id.to_s, name: tag.name } },
            }
          }
        }
      }
    end

    it { is_expected.to eql result }
  end
end
