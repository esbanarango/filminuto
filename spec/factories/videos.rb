# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title           { Faker::Lorem.paragraph() }
    description     { Faker::Lorem.paragraph() }
    file            File.new(Rails.root + 'spec/factories/videos/Video.mov')
    duration        0
    likes_count     0
    dislikes_count  0
    views_count     0
    association :user
  end
end
