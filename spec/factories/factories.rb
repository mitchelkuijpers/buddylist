FactoryGirl.define do

  factory :user do |u|
    u.email 'user@example.com'
    u.password 'password'
  end

end