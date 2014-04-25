class BooksController < ApplicationController
  def index
    @books = BooksMostRead.new.the_most_read
  end

  def show
    @book = Book.includes(:users).find(params[:id])
  end
end
