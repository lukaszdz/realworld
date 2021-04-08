# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def create?
    user?
  end

  def delete?
    owner?
  end

  private

  def owner?
    user? && record.author_id == user.id
  end
end
