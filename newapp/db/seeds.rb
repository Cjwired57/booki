require 'stattleship'
require 'pp'
require 'stripe'

Stripe.api_key = "sk_test_LaGOwlDvqeTDlyYRBnWN1y4W"

Game.delete_all
User.delete_all
Team.delete_all
#team seeds
Team.create(
  name: "Diamondbacks",
  city: "Arizona",
  logo_url: "/images/arizona-diamondbacks.png",
  stadium: "Chase Field"
  )
Team.create(
  name: "Red Sox",
  city: "Boston",
  logo_url: "/images/boston-redsox.png",
  stadium: "Fenway Park"
  )
Team.create(
  name: "Orioles",
  city: "Baltimore",
  logo_url: "/images/baltimore-orioles.png",
  stadium: "Oriole Park"
  )
Team.create(
  name: "White Sox",
  city: "Chicago",
  logo_url: "/images/chicago-whitesox.png",
  stadium: "U.S. Cellular Field"
  )
Team.create(
  name: "Cubs",
  city: "Chicago",
  logo_url: "/images/chicago-cubs.png",
  stadium: "Wrigley Field"
  )
Team.create(
  name: "Indians",
  city: "Cleveland",
  logo_url: "/images/cleveland-indians.png",
  stadium: "Progressive Field"
  )
Team.create(
  name: "Reds",
  city: "Cincinatti",
  logo_url: "/images/cincinatti-reds.png",
  stadium: "Great American Ball Park"
  )
Team.create(
  name: "Tigers",
  city: "Detroit",
  logo_url: "/images/detroit-tigers.png",
  stadium: "Comerica Park"
  )
Team.create(
  name: "Rockies",
  city: "Colorado",
  logo_url: "/images/colorado-rockies.png",
  stadium: "Coors Field"
  )
Team.create(
  name: "Astros",
  city: "Houston",
  logo_url: "/images/houston-astros.png",
  stadium: "Minute Maid Park"
  )
Team.create(
  name: "Dodgers",
  city: "Los Angeles",
  logo_url: "/images/losangeles-dodgers.png",
  stadium: "Dodger Stadium"
  )
Team.create(
  name: "Royals",
  city: "Kansas City",
  logo_url: "/images/kansascity-royals.png",
  stadium: "Kauffman Stadium"
  )
Team.create(
  name: "Marlins",
  city: "Miami",
  logo_url: "/images/miami-marlins.png",
  stadium: "Marlins Park"
  )
Team.create(
  name: "Angels",
  city: "Los Angeles",
  logo_url: "/images/losangeles-angels.png",
  stadium: "Angel Stadium"
  )
Team.create(
  name: "Brewers",
  city: "Milwaukee",
  logo_url: "/images/milwaukee-brewers.png",
  stadium: "Miller Park"
  )
Team.create(
  name: "Twins",
  city: "Minnesota",
  logo_url: "/images/minnesota-twins.png",
  stadium: "Target Field"
  )
Team.create(
  name: "Mets",
  city: "New York",
  logo_url: "/images/newyork-mets.png",
  stadium: "Citi Field"
  )
Team.create(
  name: "Yankees",
  city: "New York",
  logo_url: "/images/newyork-yankees.png",
  stadium: "Yankee Stadium"
  )
Team.create(
  name: "Phillies",
  city: "Philadelphia",
  logo_url: "/images/philadelphia-phillies.png",
  stadium: "Citizens Bank Park"
  )
Team.create(
  name: "Athletics",
  city: "Oakland",
  logo_url: "/images/oakland-athletics.png",
  stadium: "Oakland Coliseum"
  )
Team.create(
  name: "Pirates",
  city: "Pittsburgh",
  logo_url: "/images/pittsburgh-pirates.png",
  stadium: "PNC Park"
  )
Team.create(
  name: "Mariners",
  city: "Seattle",
  logo_url: "/images/seattle-mariners.png",
  stadium: "Safeco Field"
  )
Team.create(
  name: "Padres",
  city: "San Diego",
  logo_url: "/images/sandiego-padres.png",
  stadium: "Petco Park"
  )
Team.create(
  name: "Rays",
  city: "Tampa Bay",
  logo_url: "/images/tampabay-rays.png",
  stadium: "Tropicana Field"
  )
Team.create(
  name: "Giants",
  city: "San Francisco",
  logo_url: "/images/sanfrancisco-giants.png",
  stadium: "AT&T Park"
  )
Team.create(
  name: "Rangers",
  city: "Texas",
  logo_url: "/images/texas-rangers.png",
  stadium: "Globe Life Park in Arlington"
  )
Team.create(
  name: "Cardinals",
  city: "St. Louis",
  logo_url: "/images/stlouis-cardinals.png",
  stadium: "Busch Stadium"
  )
Team.create(
  name: "Blue Jays",
  city: "Toronto",
  logo_url: "/images/toronto-bluejays.png",
  stadium: "Rogers Centre"
  )
Team.create(
  name: "Nationals",
  city: "Washington",
  logo_url: "/images/washington-nationals.png",
  stadium: "Nationals Park"
  )
Team.create(
  name: "Braves",
  city: "Atlanta",
  logo_url: "/images/atlanta-braves.png",
  stadium: "Turner Field"
  )
u = User.create(email: 'tim@tim.com', password: 'timtim')
# User.create(email: 'tom@tom.com', password: 'tomtom')

# acct = Stripe::Account.create(
# {
#   :country => "US",
#   :managed => true
# }
# )


# account_id = acct.id
# s_key = acct.keys.secret
# p_key = acct.keys.publishable

# u.account_id = account_id
# ManagedAccount.create(user_id: u.id, account_id: account_id, secret_key: s_key, publishable_key: p_key )

# Stattleship.configure do |config|
#   config.api_token = '5faa60b51939bb1b58b5cc0594a2b12b'
# end
# # Construct params for the fetch
# query_params = Stattleship::Params::BaseballGamesParams.new

# # use a slug, typically 'league-team_abbreviation'
# # query_params.team_id = 'mlb-bos'

# # may need to adjust this depending on time of year
# query_params.season_id = 'mlb-2016'
# query_params.status = 'upcoming'
# query_params.on = 'today'

# # fetch will automatically traverse the paginated response links
# games = Stattleship::BaseballGames.fetch(params: query_params)

# if games.length > 0
#   # the populated object
#   pp games.first

#   # can access friendly helpers
#   pp games.first.started_at.strftime('%b %e, %l:%M %p')

#   # or, individual attributes
#   games.each do |game|
#     pp game.scoreline
#     home_team = Team.find_by(name: game.home_team.nickname)
#     away_team = Team.find_by(name: game.away_team.nickname)
#     if home_team && away_team
#       home_team_id = home_team.id
#       away_team_id = away_team.id

#       Game.create(
#         label: game.label,
#         full_name: game.name,
#         home_team_id: home_team_id,
#         away_team_id: away_team_id,
#         start_time: game.started_at
#         )

#     end
#   end
# end


#   # Construct params for the fetch
#   query_params = Stattleship::Params::BaseballGamesParams.new

# # use a slug, typically 'league-team_abbreviation'
# # query_params.team_id = 'mlb-bos'

# # may need to adjust this depending on time of year
# query_params.season_id = 'mlb-2016'
# # query_params.status = 'upcoming'
# query_params.on = 'yesterday'

# # fetch will automatically traverse the paginated response links
# games = Stattleship::BaseballGames.fetch(params: query_params)

# if games.length > 0
#   # the populated object
#   pp games.first

#   # can access friendly helpers
#   pp games.first.started_at.strftime('%b %e, %l:%M %p')

#   # or, individual attributes
#   games.each do |game|
#     pp game.scoreline
#     g = Game.find_by(full_name: game.name)
#     if g
#       winning_team = Team.find_by(name: game.winning_team.nickname)
#       g.update(
#         home_team_score: game.home_team_score,
#         away_team_score: game.away_team_score,
#         finished: true,
#         winning_team_id: winning_team.id
#         )
#     else
#       # h =  game.home_team.location.split.map(&:capitalize).join(' ')
#       # a = game.away_team.location.split.map(&:capitalize).join(' ')
#       home_team = Team.find_by(name: game.home_team.nickname)
#       away_team = Team.find_by(name: game.away_team.nickname)
#       winning_team = Team.find_by(name: game.winning_team.nickname)

#       if home_team && away_team
#         home_team_id = home_team.id
#         away_team_id = away_team.id
#         winning_team_id = winning_team.id
#         g = Game.create(
#           label: game.label,
#           full_name: game.name,
#           home_team_id: home_team_id,
#           away_team_id: away_team_id,
#           start_time: game.started_at,
#           home_team_score: game.home_team_score,
#           away_team_score: game.away_team_score,
#           finished: true,
#           winning_team_id: winning_team_id
#           )
#       end
#     end
#   end
# end