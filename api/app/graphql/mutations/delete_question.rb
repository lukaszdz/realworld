# frozen_string_literal: true

module Mutations
  class DeleteQuestion < Mutations::BaseMutation
    argument :id, ID, required: true

    field :question, Types::QuestionType, null: false

    def resolve(id:)
      question = Question.find(id)

      authorize! question, to: :delete?
      question.destroy!

      { question: question }
    end
  end
end
