class Book < ActiveRecord::Base
  has_many :book_ratings

  alias_method :ratings, :book_ratings
end
