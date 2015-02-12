FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "example@example.com"
    password "password"
    password_confirmation "password"
  end

end
