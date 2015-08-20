class SummariesController < ApplicationController

	def new

		@book= Book.find(params[:book_id])
		@summary = Summary.new
		@summary.book_id=@book.id
	end

	def create
		@summary=Summary.new(summary_params)
		@summary.book_id=params[:book_id]
		@summary.save
		redirect_to book_path(@summary.book)
	end

	def destroy
		@book=Book.find(params[:book_id])
		@summary=@book.summaries.find(params[:id])
		@summary.destroy
		redirect_to book_path(@book)
	end

	def edit
		@book=Book.find(params[:book_id])
		@summary=@book.summaries.find(params[:id])
	end
	def update
		@book=Book.find(params[:book_id])
		@book.summaries.find(params[:id]).update(summary_params)
		redirect_to book_path(@book)
	end

	private
	def summary_params
		params.require(:summary).permit(:chapter_title,:body,:chapter_number)
	end


end
