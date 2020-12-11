# frozen_string_literal: true

require 'minitest/autorun'
require 'rack/test'
require_relative '../library_api.rb'

ENV['APP_ENV'] = 'test'

class TestLibrary < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World!', last_response.body
  end

  def test_it_shows_a_book
    # this is an unstable test as it requires me to inject a testing datastore into the
    # sinatra app.  we'll leave that as a todo.
    # get '/request/1'
    # assert last_response.ok?
    # # book = '{"id":1,"title":"Antic Hay","available":true,"timestamp":null, "av}'
    # assert_equal book, last_response.body
  end
end
