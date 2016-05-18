require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('../models/album')

# get '/hello' do
#   return 'Hello World'
# end

get '/albums/new' do
  #NEW
  erb(:alb_new)
end

get '/albums' do
  @album = Artist.all()
  erb (:alb_index)
end

post '/albums' do
  @album = Album.new(params)
  @album.save
  erb(:alb_create)
end

get '/albums/:id' do
  @album = Album.find( params[:id] )
  erb(:alb_show)
end

get 'albums/:id/edit' do
  @album = Album.find(params[:id])
  rb(:alb_edit)
end

put '/albums/:id' do
  @album = Album.update(params)
  redirect to( "/albums/#{params[:id]}")
end

delete '/albums/:id' do
  Album.destroy(params[:id])
  redirect to("/albums")
end