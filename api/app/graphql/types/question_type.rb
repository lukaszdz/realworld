# frozen_string_literal: true

module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :author, UserType, null: false
    field :comments, [CommentType], null: false
    field :body, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :tags, [TagType], null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    expose_authorization_rules :update?, :delete?, :create?, :show?, :index?,
                               prefix: 'can_'

    expose_authorization_rules :create?, with: CommentPolicy,
                                         field_name: 'can_create_comment'
  end
end
