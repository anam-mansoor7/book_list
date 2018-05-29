namespace :books do
  desc 'import books from from books api'
  task import: :environment do
    books_hash = BooksApiClient.new.bestseller_list
    ImportBooks.new.call(books_hash)
  end
end
