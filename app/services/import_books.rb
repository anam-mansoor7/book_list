class ImportBooks
  def call
    books_hash = books_api_client.bestseller_list

    books_hash.each do |book_hash|
      book_details = book_hash[:book_details].first

      book = Book.find_or_initialize_by(
          primary_isbn13: book_details[:primary_isbn13],
          primary_isbn10: book_details[:primary_isbn10]
      )

      book.update(
          title: book_details[:title],
          author: book_details[:author],
          rank: book_hash[:rank],
          weeks_on_list: book_hash[:weeks_on_list]
      )
    end
  end

  private

  def books_api_client
    @books_api_client ||= BooksApiClient.new
  end
end