class RatingsFactory
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def ratings
    ratings = {}

    user.similar_users.each do |u|
      user_ratings = {}

      u.book_ratings.each do |rating|
        user_ratings[rating.book_id] = rating.rating
      end

      ratings[u.id] = user_ratings
    end

    ratings
  end
end
