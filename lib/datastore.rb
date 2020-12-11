require 'yaml'

class DataStore
  def initialize(data_path)
    @data_path = data_path
    @books = []
    load_books
  end

  def load_books
    @data = YAML.load(File.read(@data_path))
    @data.each do |key, value|
      @books << Book.new(id: key, title: value[:title], timestamp: value[:timestamp])
    end
  end

  def get_book_by_id(id)
    @books.find { |book| book.id == id }
  end

  def get_all_ids
    @books.map(&:id)
  end
end
