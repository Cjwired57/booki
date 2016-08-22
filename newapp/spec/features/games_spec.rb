require 'rails_helper'


RSpec.feature "Games", type: :feature, js: true do
  before(:each) do
    @game = Game.create(home_team_id: 4, away_team_id: 3, start_time: Time.now.strftime("%Y-%m-%d 00:00:01"))
  end

  it "Shows a list of games" do
    visit game_index_path
    expect(page).to have_content(@game.home_team_id)
    expect(page).to have_content(@game.away_team_id)
  end

  it "displays a specific game" do
    visit game_path(@game)
    expect(page).to have_content(@game.home_team_id)
    expect(page).to have_content(@game.away_team_id)
    expect(page).to have_content(@game.start_time)
  end

end
