# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title "MyString"
    description "MyText"
    duration 1
    likes_count 1
    dislikes_count 1
    views_count 1
    user nil
  end
end
