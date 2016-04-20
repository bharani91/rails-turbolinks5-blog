FactoryGirl.define do
  factory :comment do
    content "My comment"
    association :post, fixture: :post
  end
end
