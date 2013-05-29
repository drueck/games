FactoryGirl.define do
  factory :game do
    sequence(:title) { |n| "Game #{n}" }
    sequence(:bgg_id) { |n| n }
  end
end
