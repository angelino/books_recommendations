require_relative 'euclidean_distance'
require_relative 'pearson_correlation'

class Rank
  attr_reader :similarity

  def initialize(similarity_metric)
    @similarity = similarity_metric
  end

  def top_matches(prefs, person, n=5)
    scores = []

    prefs.each do |k, v|
      if k != person
        scores << { k => similarity.sim_distance(prefs, person, k) }
      end
    end

    #puts "SCORES: #{scores}"

    sorted = scores.sort_by { |s| s.values }

    reverse = []
    sorted.reverse_each do |s|
      reverse << s
    end

    #puts reverse.inspect

    reverse[0...n]
  end

end

# rank1 = Rank.new(EuclideanDistance.new)
# puts rank1.top_matches(MovieCritics.ratings, 'Toby', 3)

# rank2 = Rank.new(PearsonCorrelation.new)
# puts rank2.top_matches(MovieCritics.ratings, 'Toby', 3)
