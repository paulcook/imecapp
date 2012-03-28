FactoryGirl.define do
  factory :user do
    first_name "Test"
    last_name "User"
    sequence(:email) { |n| "example#{n}@example.com"}
    password "testpass"
    password_confirmation "test_pass"
  end