require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }
  
  it { should belong_to(:user) }
  
  it { should have_many(:items) }
  
  describe "attributes" do
    it "should have name and private attributes" do
      expect(list).to have_attributes(private: list.private, name: list.name)
    end
  end
end
