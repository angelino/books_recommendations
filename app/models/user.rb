class User < ActiveRecord::Base
  has_many :book_ratings
end
