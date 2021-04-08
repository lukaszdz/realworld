# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deleteComment', type: :graphql do
  let(:mutation) do
    <<-GRAPHQL
    mutation DeleteCommentMutation($id: ID!) {
      deleteComment(id: $id) {
        comment {
          body
        }
      }
    }
    GRAPHQL
  end
  let(:comment_author) { create(:author) }
  let(:question_author) { create(:author) }
  let(:question) { create(:question, author: question_author) }
  let(:comment) { create(:comment, author: comment_author, question: question) }
  let(:variables) do
    {
      id: comment.id
    }
  end

  context 'current_user is not defined' do
    let(:result) do
      {
        data: {
          deleteComment: nil
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
            path: ['deleteComment']
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
          deleteComment: nil
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
            path: ['deleteComment']
          }
        ]
      }
    end

    it { is_expected.to eql result }
  end

  context 'current_user is author' do
    let(:current_user) { comment_author }
    let(:result) do
      {
        data: {
          deleteComment: {
            comment: {
              body: comment.body
            }
          }
        }
      }
    end

    it { is_expected.to eql result }
  end

  context 'current_user is question author' do
    let(:current_user) { question_author }
    let(:result) do
      {
        data: {
          deleteComment: nil
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
            path: ['deleteComment']
          }
        ]
      }
    end

    it { is_expected.to eql result }
  end
end
