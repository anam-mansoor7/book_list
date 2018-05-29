require 'rails_helper'

describe ImportBooks do
  let(:instance) { described_class.new }
  let(:stubbed_response) do
    {
      results: [
        { rank: 1, book_details: [ { author: 'batman', title: 'I am batman', primary_isbn13: '1' } ] },
        { rank: 2, book_details: [ { author: 'superman', title: 'kypton', primary_isbn13: '2' } ] }
      ]
    }
  end

  before do
    expect_any_instance_of(BooksApiClient)
      .to receive(:bestseller_list)
      .and_return(stubbed_response[:results])
  end

  it 'imports the books' do
    expect { instance.call }.to change(Book, :count).from(0).to(2)
  end

  # pending 'have the correct details' do
  #   instance.call
  #
  #   expect(Book.first.attributes.symbolize_keys).to include({ author: 'batman', title: 'I am batman', primary_isbn13: '1' })
  # end
end
