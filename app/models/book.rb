class Book < ActiveRecord::Base
  has_many :book_ratings
  has_many :users, through: :book_ratings

  alias_method :ratings, :book_ratings
  alias_method :readers, :users

  def number_of_readers
    book_ratings.count
  end
end
