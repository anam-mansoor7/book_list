namespace :books do
  desc 'import books from from books api'
  task import: :environment do
    ImportBooks.new.call
  end
end
