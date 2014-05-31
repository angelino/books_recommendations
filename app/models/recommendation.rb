class Recommendation
  attr_reader :similarity

  def initialize(similarity)
    @similarity  = similarity
  end

  def recommendations_for(preferences, person)
    totals = Hash.new(0)
    sim_sums = Hash.new(0)

    preferences.each_key do |other|
      if other != person
        sim = similarity.sim_distance(preferences, person, other)

        if sim > 0
          preferences[other].each_key do |k|
            if (!preferences[person].has_key?(k)) || preferences[person][k] == 0
              totals[k]   += (preferences[other][k] * sim)
              sim_sums[k] += sim
            end
          end
        end
      end
    end

    # Create the normalized list
    rankings = []
    totals.each do |k, v|
      rankings << { k => (v / sim_sums[k]) }
    end

    # Return the sorted list
    sorted = rankings.sort_by { |r| r.values }

    reversed = []
    sorted.reverse_each do |s|
      reversed << s
    end

    reversed
  end
end

# r = Recommendation.new(MovieCritics.ratings, PearsonCorrelation.new)
# puts r.recommendations_for('Toby')

# r = Recommendation.new(MovieCritics.ratings, EuclideanDistance.new)
# puts r.recommendations_for('Toby')
