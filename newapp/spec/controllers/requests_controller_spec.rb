require 'rails_helper'

RSpec.describe RequestController, type: :controller do
    let(:request1) { Request.create(
	    game_id:  rand(1..20),
	    bet_amount_in_cents: rand(1000..30000),
	    owner_id: 25,
	    opponent_id: rand(1..20),
	    owner_team_id: rand(1..20),
	    opponent_team_id: rand(1..20),
	    accepted: true
    	)
	}
    let(:request2) { Request.create(
	    game_id:  rand(1..20),
	    bet_amount_in_cents: rand(1000..30000),
	    owner_id: rand(1..20),
	    opponent_id: 25,
	    owner_team_id: rand(1..20),
	    opponent_team_id: rand(1..20),
	    accepted: true
    	)
    }
    let(:user) { User.create(
	    id: 25,
	    email: Faker::Internet.email,
	    password_digest: Faker::Internet.password
    	)
    }

	context '#index' do
		before(:each) do

		end

		context 'with no requests made' do
			it 'renders index view' do
				get :index, {}, {}
				expect(response).to have_rendered :index
			end

			it 'assigns requests' do
				@first = :request1
				@second = :request2

			    get :index

				expect(assigns[:requests]).to eq [@first, @second]
			end

			it "returns http success" do
     			get :index

    			expect(response).to have_http_status(:success)
    		end
		end
	end

end
