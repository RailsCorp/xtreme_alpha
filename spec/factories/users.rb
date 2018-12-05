FactoryBot.define do
  factory :user do
    provider { "email" }
    uid { "admin1@example.com" }
    email { "admin1@example.com" }
    name { "test" }
    password { "11111111" }
    password_confirmation { "11111111" }
    allow_password_change { false }
    reset_password_token { "yyyyyyyyy" }
    reset_password_sent_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    remember_created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    sign_in_count { 0 }
    last_sign_in_at { Faker::Time.between(3.days.ago, 2.days.ago, :all) }
    current_sign_in_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
    current_sign_in_ip { "192.168.11.1" }
    last_sign_in_ip { "192.168.11.1" }
    tokens { { "RqCpylnDWcDUQVntAbpyDw": { "token": "$2a$10$Trxo4TEcqBAJvgmr/dqD1ezqEIuYYr5JozbN6vf5VK9VQ0DdF9U2u", "expiry": "1545223042" } } }
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
