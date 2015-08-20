class BooksController < ApplicationController

	def index
		@Books=Book.all
	end

	def new
		@Book=Book.new
	end
	def edit
		@Book=Book.find(params[:id])
	end
	def update
		@Book=Book.find(params[:id])
		@Book.update(book_params)
		redirect_to books_path
	end

	def destroy
		@Book=Book.find(params[:id]).destroy
		redirect_to editor_path
	end



	def create
		@Book=Book.new
		@Book.title=params[:book][:title]
		@Book.save
		redirect_to books_path()
	
	end

	def show
		@Book=Book.find(params[:id])
		@Summaries=@Book.summaries
	end
	def editor
		@Books=Book.all
	end
	private
	def book_params
		params.require(:book).permit(:title)
	end


end
