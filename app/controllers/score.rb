get '/scores/:id' do
  challenge = Activity.find(params[:id])
  score = current_user.player_stat(challenge)
  erb :'users/players/_player_score', locals: { challenge: challenge, score: score }
end

get '/scores' do
  challenges = Activity.where(activity_type: "Challenge")
  players = User.players
  erb :'scores/_new', locals: { challenges: challenges, players: players }
end

post '/scores' do
  debug(params)
  score = Score.create(user_id: params[:user_id], activity_id: params[:activity_id], value: params[:value])
  player = User.find(params[:user_id])
  if request.xhr?
    # content_type :html
    erb :'users/coaches/_scoreboard', layout: false, locals: { players: User.players }
  else
    redirect '/'
  end
end