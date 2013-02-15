FactoryGirl.define do
  factory :user do
    username              'testUser'
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    password              'lisasimpsons'
    password_confirmation 'lisasimpsons'
  end
end