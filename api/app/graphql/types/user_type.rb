# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :username, ID, null: false
    field :email, String, null: false
    field :profile, Types::ProfileType, null: false
    field :questions_connection, QuestionType.connection_type, null: false do
      argument :tag_names, [String], required: false
    end

    def questions_connection(tag_names: [])
      scope = object.questions.order(created_at: :desc)
      scope = scope.tagged_with(Tag.where(name: tag_names)) if tag_names.present?

      scope
    end

    field :is_viewer, Boolean, null: false, resolver_method: :viewer?

    def viewer?
      object == context[:current_user]
    end

    expose_authorization_rules :update?, prefix: 'can_'
  end
end
