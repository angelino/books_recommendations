class EuclideanDistance
  def sim_distance(prefs, person1, person2)
    #puts "Preferences: #{prefs}"
    puts "Person1: #{person1}"
    puts "Person2: #{person2}"

    shared_items = {}

    prefs[person1].each do |k, v|
      shared_items[k] = 1 if prefs[person2][k]
    end

    # if they have no ratings in common, return 0
    puts "NO RATINGS IN COMMON to #{person1} and #{person2}" if shared_items.size == 0
    return 0 if shared_items.size == 0

    # Add up the squares of all the differences
    squares = []
    prefs[person1].each do |k, v|
      puts "Book: #{k}"
      v2 = prefs[person2][k]

      if v2
        square = ((v - v2) ** 2)
        puts "(#{v} - #{v2}) ** 2 = #{square}"
        squares << square
      end
    end

    sum_of_squares = 0
    squares.each do |s|
      sum_of_squares += s
    end

    #puts "Sum of Squares: #{sum_of_squares}"

    distance =  1 / (1.0 + sum_of_squares)

    puts "Euclidean Distance #{distance}"

    distance
  end
end
