FactoryBot.define do
  factory :item do
    sequence(:body) { |n| "Complete task #{n}" }
    completed false
    list
  end
end
