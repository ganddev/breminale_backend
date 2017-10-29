FactoryBot.define do
  factory :location do
    name 'MyString'
    description 'MyString'
    latitude 1.5
    longitude 1.5
    association :user, factory: :user
    archived false
    image_url 'MyString'
  end
end
