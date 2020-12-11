# frozen_string_literal: true

require 'yaml'

class DataStore
  def initialize(data_path)
    @data_path = data_path
    @books = []
    load_books
  end

  def load_books
    @data = YAML.safe_load(File.read(@data_path), permitted_classes: [Symbol])
    @data.each do |key, value|
      @books << Book.new(id: key, title: value[:title], timestamp: value[:timestamp])
    end
  end

  def book_by_id(id)
    @books.find { |book| book.id == id }
  end

  def all_book_ids
    @books.map(&:id)
  end
end
