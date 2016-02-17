FactoryGirl.define do
  factory :user do
    email "guess@who.me"
    password "qwerty"
    password_confirmation "qwerty"
  end
end
