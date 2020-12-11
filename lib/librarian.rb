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

  def handle_checkout(checkout)
    email = checkout['email']
    title = checkout['title']

    if email_valid?(email)
      book = @datastore.book_by_title(title)
      if book.available?
        book.set_timestamp
        library_card = [:success, book.dup]
        book.set_to_unavailable
        @datastore.save_books
        return library_card
      else
        return library_card = [:success, book]
      end
    else
      [:access_denied, 'You must provide a valid email address']
    end
  end

  private

  def email_valid?(email)
    email.match?(URI::MailTo::EMAIL_REGEXP)
  end
end
