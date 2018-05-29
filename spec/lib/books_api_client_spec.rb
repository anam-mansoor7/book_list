require 'rails_helper'

describe BooksApiClient do
  let(:book_api_client) { described_class.new }
  let(:base_url) { ENV['BOOKS_API_URL'] }
  let(:base_api_key) { ENV['BOOKS_API_KEY'] }

  before do
    stub_request(
      :get, "#{base_url}/lists//.json?api-key=#{base_api_key}&list-name=hardcover-fiction&published-date=2018-01-07"
    ).to_return(:status => 200, :body => JSON.generate(response), :headers => {})
  end

  describe "#bestseller_list" do
    context 'when response is OK' do
      let(:response) do
        { results: [ { book_details: [ { author: 'batman' } ] } ] }
      end

      it 'returns the books array' do
        expect(book_api_client.bestseller_list).to eq(response[:results])
      end
    end
  end
end
