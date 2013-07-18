FactoryGirl.define do
  factory :member do
    email 'ryancmoret@example.com'
    password 'password'
    password_confirmation { password }
  end
end

