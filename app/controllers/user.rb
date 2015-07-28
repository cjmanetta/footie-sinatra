get '/' do
  # redirect '/sessions'
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end

get '/users/:id' do
  @challenges = Activity.where(activity_type: "Challenge")
  @scores = Score.where(user_id: params[:id])
  @players = User.players
  debug(current_user.scores)
  if is_coach?
    erb :'users/coaches/coach_index'
  else
    erb :'users/players/player_index'
  end
end


