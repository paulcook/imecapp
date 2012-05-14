FactoryGirl.define do
  factory :address do
    address "123 Corp Road"
    city "Columbus"
    state "OH"
    zipcode "12345"
    association :company, :factory=>:provider_company
  end
end
