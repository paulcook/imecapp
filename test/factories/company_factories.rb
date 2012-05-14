FactoryGirl.define do
  factory :company do
    sequence(:name) { |n| "Corp #{n}" }
    sequence(:tax_id) { |n| "#{n}" }
    is_501c3 false
    factory :provider_company do
      company_type "provider"
    end
    factory :supporter_company do
      company_type "supporter"
    end
  end
end
