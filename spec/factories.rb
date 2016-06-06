FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
    read "MyString"
  end
  factory :user do
    email "MyString"
    password_digest "MyString"
  end
end