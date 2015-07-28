# get '/sessions' do
#   redirect "https://auth.teamsnap.com/oauth/authorize?client_id=#{ENV['CLIENT_ID']}&redirect_uri=http%3A%2F%2Flocalhost%3A9393%F/&response_type=code"
# end

post '/sessions' do
  # api = Teamsnap::Client.new
  # debug(params)
  user = User.authenticate(params[:username], params[:password])

  if user
    login(user)
    redirect '/'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end