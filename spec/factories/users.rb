FactoryGirl.define do
  factory :user do
    username 'testUser'
    first_name 'Test'
    last_name 'User'
    email 'example@example.com'
    password 'lisasimpsons'
    password_confirmation 'lisasimpsons'
  end
end