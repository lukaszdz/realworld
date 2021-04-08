# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_comment, mutation: Mutations::CreateComment
    field :create_question, mutation: Mutations::CreateQuestion
    field :delete_comment, mutation: Mutations::DeleteComment
    field :delete_question, mutation: Mutations::DeleteQuestion
    field :follow_user, mutation: Mutations::FollowUser
    field :sign_in, mutation: Mutations::SignIn
    field :sign_up, mutation: Mutations::SignUp
    field :unfollow_user, mutation: Mutations::UnfollowUser
    field :update_question, mutation: Mutations::UpdateQuestion
    field :update_user, mutation: Mutations::UpdateUser
  end
end
