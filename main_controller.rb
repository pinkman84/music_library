require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/artist')
require_relative('./models/album')

require_relative('./app/album_controller')
require_relative('./app/artist_controller')
