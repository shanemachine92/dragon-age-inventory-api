FactoryGirl.define do
  factory :inventory do
    title { Faker::Lorem.word }
    created_by { Faker::HarryPotter.character }
  end
end
