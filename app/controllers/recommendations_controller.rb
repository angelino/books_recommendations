class RecommendationsController < ApplicationController
  def show
    #logger.debug "RATINGS: #{ratings.inspect}"

    recommendation = Recommendation.new(EuclideanDistance.new)
    ratings = RatingsFactory.new(user).ratings
    recommendations = recommendation.recommendations_for(ratings, user.id)
    #logger.debug "RECOMMENDATIONS: #{rec.inspect}"

    @recommended_books = []
    recommendations[0...9].each do |r|
      @recommended_books << Book.find(r.keys.first)
    end
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
