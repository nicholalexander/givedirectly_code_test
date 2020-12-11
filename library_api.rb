require 'sinatra'
require 'yaml'
require 'pry'
require 'json'

require_relative './library_api/book.rb'
require_relative './library_api/datastore.rb'
require_relative './library_api/librarian.rb'

librarian = Librarian.new(DataStore.new)

before do
  content_type :json
end

get '/' do
  'Hello World!'
end

get '/request' do
  librarian.full_catalogue_ids.to_json
end

get '/request/:id' do
  librarian.get_by_id(params[:id].to_i).as_json.to_json
end

