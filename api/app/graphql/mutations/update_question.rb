# frozen_string_literal: true

module Mutations
  class UpdateQuestion < Mutations::BaseMutation
    class UpdateQuestionInput < Types::BaseInputObject
      argument :body, String, required: true
      argument :tag_ids, [ID], required: true

      def prepare
        to_h
      end
    end

    argument :id, ID, required: true
    argument :input, UpdateQuestionInput, required: true

    field :question, Types::QuestionType, null: false

    def resolve(id:, input:)
      question = Question.find(id)

      authorize! question, to: :update?

      question.update!(input)

      { question: question }
    end
  end
end
