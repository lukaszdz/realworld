# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'question', type: :graphql do
  let(:query) do
    <<-GRAPHQL
    query QuestionQuery($id: ID!) {
      question(id: $id) {
        author {
          username
        }
        body
        canCreateComment {
          value
        }
        canDelete {
          value
        }
        canUpdate {
          value
        }
        comments {
          id
        }
        createdAt
        id
        tags {
          id
          name
        }
        updatedAt
      }
    }
    GRAPHQL
  end
  let(:author) { create(:author) }
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
          question: {
            author: {
              username: question.author.username
            },
            body: question.body,
            canCreateComment: { value: false },
            canDelete: { value: false },
            canUpdate: { value: false },
            comments: [],
            createdAt: question.created_at.iso8601.to_s,
            id: question.id.to_s,
            tags: [],
            updatedAt: question.updated_at.iso8601.to_s,
          }
        }
      }
    end

    it { is_expected.to eql result }
  end

  context 'current_user is a user' do
    let(:current_user) { create(:user) }
    let(:result) do
      {
        data: {
          question: {
            author: {
              username: question.author.username
            },
            body: question.body,
            canCreateComment: { value: true },
            canDelete: { value: false },
            canUpdate: { value: false },
            comments: [],
            createdAt: question.created_at.iso8601.to_s,
            id: question.id.to_s,
            tags: [],
            updatedAt: question.updated_at.iso8601.to_s,
          }
        }
      }
    end

    it { is_expected.to eql result }
  end

  context 'current_user is the author of the question' do
    let(:current_user) { author }
    let(:result) do
      {
        data: {
          question: {
            author: {
              username: question.author.username
            },
            body: question.body,
            canCreateComment: { value: true },
            canDelete: { value: true },
            canUpdate: { value: true },
            comments: [],
            createdAt: question.created_at.iso8601.to_s,
            id: question.id.to_s,
            tags: [],
            updatedAt: question.updated_at.iso8601.to_s,
          }
        }
      }
    end

    it { is_expected.to eql result }
  end
end
