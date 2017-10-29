FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'MyString'
    password_confirmation 'MyString'
  end
end
