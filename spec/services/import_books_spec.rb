require 'rails_helper'

describe ImportBooks do
  let(:instance) { described_class.new }
  let(:books_hash) do
    [
      { rank: 1, book_details: [ { author: 'batman', title: 'I am batman', primary_isbn13: '1' } ] },
      { rank: 2, book_details: [ { author: 'superman', title: 'kypton', primary_isbn13: '2' } ] }
    ]
  end

  it 'imports the books' do
    expect { instance.call(books_hash) }.to change(Book, :count).from(0).to(2)
  end

  it 'have the correct details' do
    instance.call(books_hash)

    expect(Book.first).to have_attributes({ author: 'batman', title: 'I am batman', primary_isbn13: '1' })
    expect(Book.last).to have_attributes({ author: 'superman', title: 'kypton', primary_isbn13: '2' })
  end
end
