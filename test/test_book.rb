# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/book.rb'

class TestBook < Minitest::Test
  def setup
    @book = Book.new(id: 1, title: 'A Test Book', timestamp: nil)
  end

  def test_that_book_is_available_when_timestamp_is_nil
    @book.timestamp = nil
    assert_equal @book.available?, true
  end

  def test_that_a_book_is_unavailable_when_the_timestamp_is_set
    @book.timestamp = Time.now
    assert_equal @book.available?, false
  end

  def test_as_json_includes_all_fields
    assert_equal @book.as_json, { id: 1, title: 'A Test Book', available: true, timestamp: nil }
  end
end
