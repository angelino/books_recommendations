class BooksController < ApplicationController
  def index
    @books = Book.limit(100)
  end

  def show
    @book = Book.includes(:users).find(params[:id])
  end
end
