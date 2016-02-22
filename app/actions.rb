# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index_track'
end

get '/tracks/new' do
  @track = Track.new
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
    author: params[:author]  
  )

  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new_track'
  end
end