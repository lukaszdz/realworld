# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questionsConnection', type: :graphql do
  let(:query) do
    <<-GRAPHQL
    query QuestionsConnectionQuery($before: String, $after: String, $first: Int, $last: Int, $tagNames: [String!]) {
      questionsConnection(before: $before, after:$after, first: $first, last: $last, tagNames: $tagNames) {
        edges {
          node {
            id
          }
        }
        pageInfo {
          endCursor
          hasNextPage
          hasPreviousPage
          startCursor
        }
      }
    }
    GRAPHQL
  end

  let(:author) { create(:author) }
  let(:tags) { create_list(:tag, 1) }

  let(:variables) do
    { first: 2 }
  end

  let!(:tagged_questions) { create_list(:question, 2, author: author, tags: tags) }
  let!(:questions) { create_list(:question, 2, author: author) }

  context 'current_user is not defined' do
    let(:result) do
      {
        data: {
          questionsConnection: {
            edges: questions.reverse.map { |question| { node: { id: question.id.to_s } } },
            pageInfo: {
              endCursor: 'Mg',
              hasNextPage: true,
              hasPreviousPage: false,
              startCursor: 'MQ'
            }
          }
        }
      }
    end
    it { is_expected.to eql result }
  end

  context 'current_user is nil with tag' do
    let(:variables) do
      { first: 4, tagNames: tags.map(&:name) }
    end
    let(:result) do
      {
        data: {
          questionsConnection: {
            edges: tagged_questions.reverse.map { |question| { node: { id: question.id.to_s } } },
            pageInfo: {
              endCursor: 'Mg',
              hasNextPage: false,
              hasPreviousPage: false,
              startCursor: 'MQ'
            }
          }
        }
      }
    end

    it { is_expected.to eql result }
  end
end
