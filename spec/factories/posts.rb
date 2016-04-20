FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Title #{n}" }
    content "MyText"
  end
end
