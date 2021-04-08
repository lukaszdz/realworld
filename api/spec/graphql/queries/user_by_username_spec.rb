# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'userByUsername', type: :graphql do
  let(:query) do
    <<-GRAPHQL
    query UserByUsernameQuery($username: ID!) {
      userByUsername(username: $username) {
        username
        email
        profile {
          id
          bio
          imageUrl
        }
        isViewer
        questionsConnection {
          edges {
            node {
              id
            }
          }
        }
        canUpdate {
          value
        }
      }
    }
    GRAPHQL
  end
  let(:user) { create(:user, profile: build(:profile)) }
  let(:owner) { create(:user, profile: build(:profile)) }
  let(:variables) do
    {
      username: owner.username
    }
  end

  context 'current_user is not defined' do
    let(:result) do
      {
        data: {
          userByUsername: {
            questionsConnection: {
              edges: []
            },
            canUpdate: { value: false },
            email: owner.email,
            isViewer: false,
            profile: {
              id: owner.profile.id.to_s,
              bio: owner.profile.bio,
              imageUrl: owner.profile.image_url
            },
            username: owner.username,
          }
        }
      }
    end
    it { is_expected.to eql result }
  end

  context 'current_user is user' do
    let(:current_user) { user }
    let(:result) do
      {
        data: {
          userByUsername: {
            questionsConnection: {
              edges: []
            },
            canUpdate: { value: false },
            email: owner.email,
            isViewer: false,
            profile: {
              id: owner.profile.id.to_s,
              bio: owner.profile.bio,
              imageUrl: owner.profile.image_url
            },
            username: owner.username,
          }
        }
      }
    end
    it { is_expected.to eql result }
  end

  context 'current_user is owner' do
    let(:current_user) { owner }
    let(:result) do
      {
        data: {
          userByUsername: {
            questionsConnection: {
              edges: []
            },
            canUpdate: { value: true },
            email: owner.email,
            isViewer: true,
            profile: {
              id: owner.profile.id.to_s,
              bio: owner.profile.bio,
              imageUrl: owner.profile.image_url
            },
            username: owner.username
          }
        }
      }
    end
    it { is_expected.to eql result }
  end
end
