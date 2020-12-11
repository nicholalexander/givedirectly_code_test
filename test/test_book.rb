# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/book.rb'

class TestBook < Minitest::Test
  def setup
    @book = Book.new(id: 1, title: 'A Test Book', timestamp: nil, available: true)
  end

  def test_as_json_includes_all_fields
    assert_equal @book.as_json, { id: 1, title: 'A Test Book', available: true, timestamp: nil }
  end

  def test_to_h_has_all_fields
    assert_equal @book.to_h, { title: 'A Test Book', timestamp: nil, available: true }
  end
end
