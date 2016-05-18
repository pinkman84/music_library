require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/artist')
require_relative('./models/album')

require_relative('./app/album_controller')
require_relative('./app/artist_controller')


get '/home' do
  erb(:home)
end

get '/library'do
  @artist = Artist.all()
  @album = Album.all()
  erb(:library)
end