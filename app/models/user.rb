class User < ActiveRecord::Base
  has_many :book_ratings
  has_many :books, through: :book_ratings

  def number_of_readed_books
    books.count
  end

  def number_of_similar_users
    unique_similar_user_ids.reject { |id| id == self.id }.size
  end

  def similar_users
    #logger.debug "Similar User IDs: #{similar_user_ids.inspect}"

    logger.debug "Unique Similar User IDs: #{unique_similar_user_ids.inspect}"

    @similar_users ||= User.includes(:book_ratings).where(id: unique_similar_user_ids)
  end

  def readed_book_ids
    @readed_book_ids ||= book_ratings.pluck(:book_id)
  end

  def similar_user_ids
    @similar_user_ids ||= BookRating.where(book_id: readed_book_ids).pluck(:user_id)
  end

  def unique_similar_user_ids
    similar_user_ids.uniq
  end
end
