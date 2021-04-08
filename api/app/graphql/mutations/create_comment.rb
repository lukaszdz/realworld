# frozen_string_literal: true

module Mutations
  class CreateComment < Mutations::BaseMutation
    class CreateCommentInput < Types::BaseInputObject
      argument :body, String, required: true
      def prepare
        to_h
      end
    end

    argument :question_id, ID, required: true
    argument :input, CreateCommentInput, required: true

    field :comment, Types::CommentType, null: false

    def resolve(question_id:, input:)
      authorize! Comment, to: :create?
      question = Question.find(question_id)
      comment = Comment.create!(
        question: question,
        author: context[:current_user],
        body: input[:body]
      )

      { comment: comment }
    end
  end
end
