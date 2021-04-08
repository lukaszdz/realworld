# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :questions_connection, QuestionType.connection_type, null: false do
      argument :tag_names, [String], required: false
    end

    def questions_connection(tag_names: [])
      scope = Question.all.order(created_at: :desc)
      scope = scope.tagged_with(Tag.where(name: tag_names)) if tag_names.present?

      scope
    end

    field :question, QuestionType, null: true do
      argument :id, ID, required: true
    end

    def question(id:)
      question = Question.find(id)
    end

    field :popular_tags, [TagType], null: false

    def popular_tags
      Tag.most_used
    end

    field :tags, [TagType], null: false

    def tags
      Tag.all
    end

    field :tag, TagType, null: false do
      argument :id, ID, required: true
    end

    def tag(id:)
      Tag.find(id)
    end

    field :comment, CommentType, null: false do
      argument :id, ID, required: true
    end

    def comment(id:)
      Comment.find(id)
    end

    field :user_by_username, UserType, null: false do
      argument :username, ID, required: true
    end

    def user_by_username(username:)
      User.find_by(username: username)
    end

    field :viewer, UserType, null: true

    def viewer
      context[:current_user]
    end

    expose_authorization_rules :create?, with: QuestionPolicy, field_name: 'can_create_question'
  end
end
