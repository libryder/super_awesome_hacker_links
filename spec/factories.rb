FactoryGirl.define do
  factory :user do
    username "password"
    password "woopass"
    sequence(:email) {|n| "johngalt#{n}@utopia.com" }
  end

  factory :vote do
    user
    link
  end

  factory :link do
    sequence(:url) {|n| "http://www.google#{n}.com" }
    description "Some obscure search engine"
    rating 23
    user
  end
end
