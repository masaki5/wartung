# FactoryBot.define do
#   factory :user do
#     name { Faker::Lorem.characters }
#     email { Faker::Internet.email }
#     password = Faker::Internet.password(6)
#     password { 'password' }
#     password_confirmation { 'password' }
#   end
# end