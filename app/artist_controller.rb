

# get '/hello' do
#   return 'i am currently working'
# end

get '/artists/new' do
  #NEW
  erb (:art_new)
end

get '/artists' do
  @artist = Artist.all()
  # binding.pry
  erb (:art_index)
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save
  erb(:art_create)
end

get '/artists/:id' do
  @artist = Artist.find( params[:id] )
  erb(:art_show)
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:art_edit)
end

put '/artists/:id' do
  @artist = Artist.update(params)
  redirect to( "/artists/#{params[:id]}")
end

delete '/artists/:id' do
  Artist.destroy(params[:id])
  redirect to("/artists")
end