class RankController < ApplicationController
  def show
    #logger.debug "RATINGS: #{ratings.inspect}"

    rank = Rank.new(EuclideanDistance.new)
    ratings = RatingsFactory.new(user).ratings
    matches = rank.top_matches(ratings, user.id, 5)
    #logger.debug "TOP MATCHES #{matches.inspect}"

    @top_similar_users = []

    matches.each do |m|
      @top_similar_users << User.find(m.keys.first)
    end
  end

  private

  def user
    @user ||= User.includes(:books => :book_ratings).find(params[:user_id])
  end
end

