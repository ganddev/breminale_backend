FactoryBot.define do
  factory :event do
    name 'MyString'
    description 'MyString'
    start_time { DateTime.now }
    sound_cloud_url 'MyString'
    sound_cloud_user_id 'MyString'
    association :location, factory: :location
    association :user, factory: :user
    archived false
    image_url 'MyString'
  end
end
