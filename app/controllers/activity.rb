get '/activities/:id' do
  redirect '/'
end

delete '/activities/:id' do
  activity = Activity.find(params[:id])
  # debug(activity.id)
  activity.destroy
  if request.xhr?
    content_type :json
    {id: activity.id}.to_json
  else
    redirect '/'
  end
end

get '/activities' do
end

post '/activities/new' do
  challenge = Activity.create(activity_type: params[:activity_type], title: params[:title], description: params[:description], date: params[:date])
  if request.xhr?
    content_type :json
    (erb :'activities/_activity', layout: false, locals: { challenge: challenge }).to_json
  else
    redirect '/'
  end
end

put '/activities/:id' do
  activity = Activity.find(params[:id])

  activity.update(title: params[:title], description: params[:description], date: params[:date] )
  debug(activity)
  if request.xhr?
    content_type :json
    {id: activity.id, title: activity.title, description: activity.description, date: activity.date}.to_json
  else
    redirect '/'
  end
end