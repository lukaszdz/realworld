require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:body).with_options(null: false) }
    it { is_expected.to have_db_column(:author_id).with_options(null: false, foreign_key: { to_table: :users }) }
    it { is_expected.to have_db_column(:created_at).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).with_options(null: false) }
    it { is_expected.to have_db_index(:author_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:author) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').validate }
    it { is_expected.to have_many(:tags).validate }
    it { is_expected.to have_many(:taggings).validate.dependent(:destroy) }
    it { is_expected.to have_many(:comments).validate.dependent(:destroy) }
  end

  describe '.tagged_with' do
    before(:each) do
      create_list(:tag, 3)
      create_list(:question, 3, author: build(:author), tags: [])
      create_list(:question, 3, author: build(:author), tags: Tag.all)
    end

    subject { described_class.tagged_with(Tag.all) }

    it { expect(subject.length).to be 3 }
  end
end