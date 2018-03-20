require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }
  let(:item) { create(:item, list: list) }
  
  it { should validate_presence_of(:body) }
  
  it { should belong_to(:list) }

  describe "attributes" do
    it "should have body and completed attributes" do
      expect(item).to have_attributes(completed: item.completed, body: item.body)
    end
  end
end
