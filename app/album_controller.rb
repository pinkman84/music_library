# require('sinatra')
# require('sinatra/contrib/all') if development?
# require('pry-byebug')
# require_relative('../models/album')

# get '/hello' do
#   return 'Hello World'
# end

get '/albums/new' do
  #NEW
  @artists = Artist.all()
  erb(:alb_new)
end

get '/albums' do
  @albums = Album.all()
  erb (:alb_index)
end

post '/albums' do
  @albums = Album.new(params)
  @albums.save
  erb(:alb_create)
end

get '/albums/:id' do
  @albums = Album.find( params[:id] )
  erb(:alb_show)
end

get '/albums/:id/edit' do
  @albums = Album.find(params[:id])
  # binding.pry
  erb(:alb_edit)
end

put '/albums/:id' do
  @albums = Album.update(params)
  redirect to( "/albums/#{params[:id]}")
end

delete '/albums/:id' do
  Album.destroy(params[:id])
  redirect to("/albums")
end