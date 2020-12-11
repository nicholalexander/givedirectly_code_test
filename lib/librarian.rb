class Librarian
  def initialize(datastore)
    @datastore = datastore
  end

  def full_catalogue_ids
    @datastore.get_all_ids
  end

  def get_by_id(id)
    @datastore.get_book_by_id(id)
  end
end
