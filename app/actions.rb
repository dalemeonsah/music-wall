# Homepage (Root path)
helpers do 
  def user_logged_in?
    session[:email] && session[:email] != "" 
  end

  def get_current_user
    if session[:email] && session[:email] != ""
      User.find_by(email: session[:email])
    end
  end
end

get '/' do
  redirect '/tracks'
end

get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.password == params[:password]
    session[:email] = @user.email
    redirect '/tracks'
  else
    redirect '/users/login'
  end
end

get '/users/logout' do
  session.clear
  #session[:email] = ""
  redirect '/tracks'
end

get '/users/signup' do
  erb :'users/signup'
end

post '/users' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )

  if @user.save
    redirect '/users'
  else
    erb :'users/signup'
  end
end

get '/tracks' do
  @tracks = Track.all
  #@tracks = Track.joins("LEFT JOIN users ON tracks.user_id = users.id ")
  erb :'tracks/index_track'
end

get '/tracks/new' do
  @tracks = Track.new
  erb :'tracks/new_track'
end

get '/tracks/:id' do
  @track = Track.find(params[:id])
  @all_track = Track.all
  erb :'tracks/show_track'
end

post '/tracks' do
  @track = Track.new(
    song_title: params[:song_title],
    url: params[:url],
    author: params[:author],
    user_id: get_current_user.id
  )

  if @track.save && @email_by
    redirect '/tracks'
  else
    erb :'tracks/new_track'
  end
end