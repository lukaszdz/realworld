# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'createComment', type: :graphql do
  let(:mutation) do
    <<-GRAPHQL
    mutation CreateCommentMutation($questionId: ID!, $input: CreateCommentInput!) {
      createComment(questionId: $questionId, input: $input) {
        comment {
          question {
            id
          }
          author {
            username
          }
          body
        }
      }
    }
    GRAPHQL
  end
  let(:tags) { create_list(:tag, 3) }
  let(:question) { create(:question, author: build(:author)) }
  let(:comment_attributes) { attributes_for(:comment) }
  let(:variables) do
    {
      questionId: question.id,
      input: {
        body: comment_attributes[:body]
      }
    }
  end

  context 'current_user is not defined' do
    let(:result) do
      {
        data: {
          createComment: nil
        },
        errors: [
          {
            extensions: { code: 'UNAUTHORIZED', details: {}, fullMessages: [] },
            locations: [
              { column: 7, line: 2 }
            ],
            message: 'You are not authorized to perform this action', path: ['createComment']
          }
        ]
      }
    end

    it { is_expected.to eql result }
  end

  context 'current_user is defined' do
    let(:current_user) { create(:user) }

    let(:result) do
      {
        data: {
          createComment: {
            comment: {
              question: {
                id: question.id.to_s
              },
              author: {
                username: current_user.username
              },
              body: comment_attributes[:body]
            }
          }
        }
      }
    end

    it { is_expected.to eql result }
  end
end
