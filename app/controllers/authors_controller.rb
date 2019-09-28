class AuthorsController < ApplicationController

	before_action :find_author, only: [:show, :edit, :update, :destroy]

	def index
		@authors=Author.all
	end


	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)
		if @author.save
      flash[:title]='¡Success!'
    	flash[:notice]='Your account was created'
    	render 'home/index'
    else
       flash[:title]='¡Error!'
   		 flash[:notice]='Please verify your data'
    end
	end

	def update
    @author= Author.find(params[:id])
    if @author.update(author_params)
      render 'home/index'
    else
      render :edit
    end
	end

	def destroy
    @author.destroy
    render 'home/index'
  end


  def custom_api
    author_from_api = Author.find(params[:id])
    books_related_to_author = author_from_api.books
    respond_to do |format|
      msg = { :author => author_from_api, :books => books_related_to_author}
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end

	private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth)
  end

  def find_author
  	@author = Author.find(params[:id])
  end
end
