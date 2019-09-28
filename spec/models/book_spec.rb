require 'rails_helper'

RSpec.describe Book, :type => :model do
  it "is valid with valid attributes" do
  	book = Book.create(book_title: 'hello' )
    expect(book).to be_valid
  end
end