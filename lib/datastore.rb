# frozen_string_literal: true

require 'yaml'

class DataStore
  def initialize(data_path)
    @data_path = data_path
    @books = []
    load_books
  end

  def load_books
    data = YAML.safe_load(File.read(@data_path), permitted_classes: [Symbol, Time])
    data.each do |key, value|
      @books << Book.new(id: key,
                         title: value[:title],
                         timestamp: value[:timestamp],
                         available: value[:available])
    end
  end

  def book_by_id(id)
    @books.find { |book| book.id == id }
  end

  def book_by_title(title)
    @books.find { |book| book.title == title }
  end

  def all_book_ids
    @books.map(&:id)
  end

  def save_books
    books_hash = {}
    @books.each do |book|
      books_hash[book.id] = book.to_h
    end

    File.open(@data_path, 'w') do |file|
      file.write books_hash.to_yaml
    end
  end
end
