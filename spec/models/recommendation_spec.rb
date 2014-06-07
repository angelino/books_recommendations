require 'spec_helper'

require_relative '../fixtures/movie_critics'

describe Recommendation do
  it "returns The Night Listener, Lady in the Water and Just My Luck of the best movie recommendations to Toby" do
    recommendations = Recommendation.new(EuclideanDistance.new)

    recommendations = recommendations.recommendations_for(MovieCritics.ratings, 'Toby')

    expected = [
      {"The Night Listener" => 3.5002478401415877},
      {"Lady in the Water"  => 2.7561242939959363},
      {"Just My Luck"       => 2.461988486074374}
    ]

    recommendations.should == expected
  end
end
