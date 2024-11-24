FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    pswd = Faker::Internet.password(min_length: 8)
    password { pswd }
    password_confirmation { pswd }
  end
end

# <User:0x0000ffff73d38650 id: nil, name: "test", email: "fpp@test.com", created_at: nil, updated_at: nil, password_digest: "[FILTERED]">
# useqzMI2
