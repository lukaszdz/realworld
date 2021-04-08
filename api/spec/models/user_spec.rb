# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:profile).autosave(true).dependent(:destroy) }
    it { is_expected.to have_many(:questions).with_foreign_key('author_id').dependent(:destroy) }
    it { is_expected.to have_many(:comments).with_foreign_key('author_id').dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:created_at).with_options(null: false) }
    it { is_expected.to have_db_column(:email).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).with_options(null: false) }
    it { is_expected.to have_db_column(:remember_created_at) }
    it { is_expected.to have_db_column(:reset_password_sent_at) }
    it { is_expected.to have_db_column(:reset_password_token) }
    it { is_expected.to have_db_column(:updated_at).with_options(null: false) }
    it { is_expected.to have_db_column(:username).with_options(null: false) }
    it { is_expected.to have_db_index(:email).unique }
    it { is_expected.to have_db_index(:reset_password_token).unique }
    it { is_expected.to have_db_index(:username).unique }
  end

  describe 'instance_methods' do
    it { is_expected.to respond_to(:generate_jwt).with(0).arguments }
  end

  describe 'methods' do
    subject { described_class }

    it { is_expected.to respond_to(:from_jwt).with(1).argument }
  end
end
