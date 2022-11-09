FactoryBot.define do
  factory :profile do
    user { nil }
    country { "CA" }
    state { "ON" }
    city { "Toronto" }
    experience { 1 }
    bio { "Hello its me" }
    url { "google.com" }
    location_query { "Toronto, ON, CA" }

  end
end
