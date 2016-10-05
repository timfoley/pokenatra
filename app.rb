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

get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  haml :'pokemon/edit'
end

put '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

get '/trainers' do
  @trainers = Trainer.all
  haml :"trainers/index"
end

get '/trainers/new' do
  haml :'trainers/new'
end

post '/trainers' do
  @trainer = Trainer.create(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end

get '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  haml :'trainers/show'
end

get '/trainers/:id/edit' do
  @trainer = Trainer.find(params[:id])
  haml :'trainers/edit'
end

put '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end
