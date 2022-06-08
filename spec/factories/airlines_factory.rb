FactoryBot.define do
  factory :airline do
    name { Faker::Company.name + [" Airways", " Airlines"].sample }
    image_url { Faker::LoremFlickr.image(
      search_terms: ["airlines", "logo"],
      match_all: true)
    }
  end
end
