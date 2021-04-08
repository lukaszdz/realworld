# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :questions, through: :taggings, source: :taggable, source_type: 'Question'
  validates_presence_of :name, :taggings_count

  def self.most_used(limit = 20)
    where.not(taggings_count: 0).order(taggings_count: :desc).limit(limit)
  end
end
