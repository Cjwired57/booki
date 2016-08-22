FactoryGirl.define do

  factory :bet do
    request_id { rand(1..20) }
    winner_id {nil}
  end

  factory :user do
    email { Faker::Internet.email  }
    password_digest { Faker::Internet.password  }
  end

  factory :request do
    game_id { rand(1..20) }
    bet_amount_in_cents { rand(1000..30000)}
    owner_id { rand(1..20) }
    opponent_id { rand(1..20) }
    owner_team_id { rand(1..20) }
    opponent_team_id { rand(1..20) }
    accepted { true }
  end
end
