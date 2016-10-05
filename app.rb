require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'
require_relative 'models/trainer'

get '/' do
  haml :index
end

get '/pokemon' do
  @pokemons = Pokemon.all
  haml :'pokemon/index'
end

get '/pokemon/new' do
  haml :'pokemon/new'
end

post '/pokemon' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  haml :'pokemon/show'
end
