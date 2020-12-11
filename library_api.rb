require 'sinatra'
require 'yaml'

class Librarian
  def initialize
    @data = YAML.load(File.read("data/fake_data.yml"))
  end

  def full_catalogue
    @data.keys
  end
end


librarian = Librarian.new

before do
  content_type :json
end

get '/' do
  'Hello World!'
end

get '/request' do
  librarian.full_catalogue.to_json
end
