# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/datastore.rb'

class TestDataStore < Minitest::Test
  def setup
    @datastore = DataStore.new('test/fixtures/books.yaml')
  end

  def test_that_books_is_populated_after_initialization
    assert_equal @datastore.get_all_ids.length, 2
  end

  def test_get_book_by_id_returns_a_book_object
    assert_equal @datastore.get_book_by_id(1).class, Book
  end

  def test_get_book_by_id_returns_the_correct_book
    assert_equal @datastore.get_book_by_id(1).title, 'Antic Hay'
  end
end
