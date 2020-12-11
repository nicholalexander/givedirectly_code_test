class DataStore
  def initialize
    @data = YAML.load(File.read("data/fake_data.yml"))
    @books = []
  end

  def load_books
    @data = YAML.load(File.read("data/fake_data.yml"))
    books = []
    @data.each do |key, value|
      books << Book.new(id: key, title: value[:title], timestamp: value[:timestamp])
    end
    @books = books
    return @books
  end

  def get_book_by_id(id)
    @books.find { |book| book.id == id }
  end

  def get_all_ids
    @books.map(&:id)
  end
end