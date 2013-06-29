FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "name#{n}@example.com" }
    sequence(:password) { |n| "paSsw0rd #{n}" }
    password_confirmation { password }
  end
end
