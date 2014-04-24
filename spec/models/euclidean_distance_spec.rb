require 'spec_helper'

require_relative '../fixtures/movie_critics'

describe EuclideanDistance do

  it "returns a distance-based similarity score for person1 and person2" do
    ed = EuclideanDistance.new
    distance = ed.sim_distance(MovieCritics.ratings, 'Lisa Rose', 'Gene Seymour')

    distance.should be_within(1.0e-12).of(0.148148148148)
  end

  it "return 0 if they have no ratings in common" do
    ed = EuclideanDistance.new
    distance = ed.sim_distance(MovieCritics.ratings, 'Lisa Rose', 'Jhon')

    distance.should == 0
  end

end
