FactoryBot.define do
  factory :list do
    private false
    sequence(:name) { |n| "List #{n}" }
    user
  end
end
