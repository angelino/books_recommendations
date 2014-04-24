class EuclideanDistance
  def sim_distance(prefs, person1, person2)
    shared_items = {}

    prefs[person1].each do |k, v|
      shared_items[k] = 1 if prefs[person2][k]
    end

    #if they have no ratings in common, return 0
    return 0 if shared_items.size == 0

    # Add up the squares of all the differences
    squares = []
    prefs[person1].each do |k, v|
      if prefs[person2][k]
        squares << ((prefs[person1][k] - prefs[person2][k]) ** 2)
      end
    end

    sum_of_squares = 0
    squares.each do |s|
      sum_of_squares += s
    end

    return 1 / (1 + sum_of_squares)
  end
end
