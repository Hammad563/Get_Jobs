FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "password" }
  end

  before :create do |user|
    user.skip_confirmation!
  end

  trait :unconfirmed do 
    before :create do |user|
      user.confirmed_at = nil
    end
  end

end
