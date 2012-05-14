FactoryGirl.define do
  factory :user do
    first_name "Test"
    last_name "User"
    sequence(:email) { |n| "example#{n}@example.com"}
    password "testpass"
    password_confirmation "testpass"
    
    factory :provider do
      association :company, :factory=>:provider_company
    end

    factory :supporter do
      association :company, :factory=>:supporter_company
    end
  end
end
