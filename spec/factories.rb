Factory.define :user do |user|
  user.email    "foo@bar.baz"
  user.password "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@qmail.com"
end