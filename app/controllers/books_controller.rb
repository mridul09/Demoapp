class BooksController < ApplicationController

	before_action :find_book, only: [:show, :edit, :update, :destroy]

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
		@authors = Author.all
	end


	def create
		@book = Book.new(book_params)
		@book_author = authorsforbooks
		@book.authors << @book_author
		if @book.save
      flash[:title]='¡Success!'
    	flash[:notice]='Your account was created'
    	render 'home/index'
    else
       flash[:title]='¡Error!'
   		 flash[:notice]='Please verify your data'
   		 render 'home/index'
    end
	end

	def destroy
    @book.destroy
    render 'home/index'
  end

  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
      render 'home/index'
    else
      render :edit
    end
  end

  def books_api
    books_from_api = Book.find(params[:id])
    authors_related_to_book = books_from_api.authors 
    respond_to do |format|
      msg = { :books => books_from_api, :authors => authors_related_to_book}
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end

	private

  def book_params
    params.require(:book).permit(:book_title)
  end

  def find_book
  	@book = Book.find(params[:id])
  end

  def authorsforbooks
    authors=[]
    params[:authors].each do |f|
      authors << Author.find(f)
    end
    authors
  end
end
