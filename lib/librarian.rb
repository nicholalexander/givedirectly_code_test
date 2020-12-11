# frozen_string_literal: true

class Librarian
  def initialize(datastore)
    @datastore = datastore
  end

  def full_catalogue_ids
    @datastore.all_book_ids
  end

  def get_by_id(id)
    @datastore.book_by_id(id)
  end
end
