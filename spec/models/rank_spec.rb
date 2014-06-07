require 'spec_helper'

require_relative '../fixtures/movie_critics'

describe Rank do

  it "returns Lisa Rose, Mick LaSalle and Cladia Puig when it is top matches for Toby" do
    rank = Rank.new(EuclideanDistance.new)

    top_matches = rank.top_matches(MovieCritics.ratings, 'Toby', n=3)

    expected = [
      {"Mick LaSalle"     => 0.3076923076923077},
      {"Michael Phillips" => 0.2857142857142857},
      {"Claudia Puig"     => 0.23529411764705882}
    ]

    top_matches.should == expected
  end

end
