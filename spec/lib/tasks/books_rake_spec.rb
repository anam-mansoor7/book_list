require 'rails_helper'

describe 'books:import' do
  include_context 'rake'

  let(:stubbed_response) do
    [
      { rank: 1, book_details: [ { author: 'batman', title: 'I am batman', primary_isbn13: '1' } ] },
      { rank: 2, book_details: [ { author: 'superman', title: 'kypton', primary_isbn13: '2' } ] }
    ]
  end

  before do
    expect_any_instance_of(BooksApiClient)
      .to receive(:bestseller_list)
      .and_return(stubbed_response)
  end

  it 'invokes the worker only once for the required shift' do
    expect { subject.invoke }.to change(Book, :count).from(0).to(2)
  end
end