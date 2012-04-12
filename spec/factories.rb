FactoryGirl.define do
  factory :user do
    username "password"
    password "woopass"
  end

  factory :link do
    url "http://www.google.com"
    description "Some obscure search engine"
    rating 23
    user
  end
end
