require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/pokemon"

get "/" do
  @pokemons = Pokemon.all
  erb :"pokemon/index"
end


get "/pokemons/:id" do
  @selected_pokemons = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

get "/pokemons/:new" do
  erb :"pokemon/new"
end

post "/pokemons" do
  @pokemons = Pokemon.create(params[:id])
  redirect "/pokemons/#{@pokemon.id}"
end
