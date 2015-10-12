FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@example.org"
  end

  factory :user do
    email

    after(:build) do |u|
      u.password = u.password_confirmation = "change_me"
    end
  end
end
