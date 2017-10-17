FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email 'test@test.com'
    password 'test'
  end
end
