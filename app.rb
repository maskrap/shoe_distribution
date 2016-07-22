require "bundler/setup"
require "pry"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/stores' do
  @stores = Store.all
  erb :stores
end

get '/brands' do
  @brands = Brand.all
  erb :brands
end

post '/stores/new' do
  name = params['name']
  @store = Store.create({name: name})
  binding.pry

  @brands = Brand.all
  redirect '/stores'
end

get '/stores/:id' do
  @store = Store.find(params["id"].to_i)
  @brands = Brand.all
  erb :store
end

post '/brands/new' do
  name = params["name"]
  brand = Brand.create({name: name})
  redirect '/brands'
end

get '/brands/:id' do
  @brand = Brand.find(params["id"].to_i)
  @stores = Store.all
  erb :brand
end

get '/stores/:id' do
  @store = Store.find(params["id"].to_i)
  @brands = Brand.all
  erb :store
end

post '/stores/:id/brand' do
  store_id = params["store_id"].to_i
  brand_id = params["brand_id"].to_i
  @brand = Brand.find(brand_id)
  @store = Store.find(store_id)
  @store.brands.push(@brand)
  redirect "/stores/#{@store.id}"
end

post '/stores/:id/brand/new' do
  @store = Store.find(params["id"].to_i)
  name = params["name"]
  brand = Brand.create({name: name})
  @store.brands.push(brand)
  redirect "/stores/#{@store.id}"
end
