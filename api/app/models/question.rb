# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :author, class_name: 'User', validate: true
  has_many :comments, dependent: :destroy, validate: true
  has_many :taggings, as: :taggable, dependent: :destroy, validate: true
  has_many :tags, through: :taggings, validate: true

  validates :body, presence: true
  validates :author, presence: true

  def self.tagged_with(tags)
    return none unless tags.present?

    joins(:taggings).merge(Tagging.joins(:tag).merge(tags)).distinct
  end
end
