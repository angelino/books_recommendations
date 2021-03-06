class Book < ActiveRecord::Base
  has_many :book_ratings
  has_many :users, through: :book_ratings

  alias_method :ratings, :book_ratings
  alias_method :readers, :users

  def number_of_readers
    @number_of_readers ||= book_ratings.count
  end

  def self.search(search, page)
    paginate per_page: 20,
             page: page,
             conditions: ['title like ?', "%#{search}%"],
             order: 'title'
  end

end

