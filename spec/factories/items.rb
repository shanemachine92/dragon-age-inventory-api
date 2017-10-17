FactoryGirl.define do
  factory :item do
    name { Faker::LeagueOfLegends.masteries}
    description { Faker::Lorem.paragraph }
    level { Faker::Number.number(2) }
    wielder { Faker::HarryPotter.house }
  end
end
