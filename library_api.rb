# frozen_string_literal: true

require 'sinatra'
require 'yaml'
require 'pry'
require 'json'

require_relative './lib/book.rb'
require_relative './lib/datastore.rb'
require_relative './lib/librarian.rb'

librarian = Librarian.new(DataStore.new('data/data.yml'))

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

post '/request' do
  checkout = JSON.parse(request.body.read)
  result = librarian.handle_checkout(checkout)

  case result[0]
  when :access_denied
    halt 403, result[1]
  when :success
    result[1].as_json.to_json
  end
end
