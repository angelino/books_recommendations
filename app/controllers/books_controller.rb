class BooksController < ApplicationController
  def index
    # @books = Book.search(params[:search], params[:page])
    @books = Book.page(params[:page]).per_page(20)
  end

  def show
    @book = Book.includes(:users).find(params[:id])
  end
end
