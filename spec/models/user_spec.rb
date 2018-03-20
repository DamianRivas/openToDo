require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  # Shoulda tests for email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@example.com").for(:email) }
  
  # Shoulda tests for password
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
  
  it { should have_many(:lists) }
  
  it { should have_many(:items).through(:lists) }
  
  describe "attributes" do
    it "should have first_name, last_name, and email attributes" do
      expect(user).to have_attributes(first_name: user.first_name, last_name: user.last_name, email: user.email)
    end
  end
  
  describe "invalid user" do
    let(:user_with_invalid_email) { User.new(first_name: "Damian", last_name: "Rivas", email: "") }
    
    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end
  
  describe "#full_name" do
    it "should return the full name of the user" do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
