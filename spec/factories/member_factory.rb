FactoryGirl.define do
  factory :member do
    email 'ryancmoret@example.com'
    password 'password'
    password_confirmation { password }

    factory :member_with_profile do
      first_name 'ryan'
      last_name 'moret'
      position_title 'consultant'
      biography 'gonna keep it short...'
    end

  end
end
