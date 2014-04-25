class PearsonCorrelation
  def sim_distance(prefs, person1, person2)
    shared_items = {}

    prefs[person1].each do |k, v|
      shared_items[k] = 1 if prefs[person2][k]
    end

    # puts shared_items

    # if they have no ratings in common, return 0
    return 0 if shared_items.size == 0


    # Add up all the preferences
    sum1 = 0
    shared_items.each do |k, v|
      sum1 += prefs[person1][k]
    end
    # puts sum1

    sum2 = 0
    shared_items.each do |k, v|
      sum2 += prefs[person2][k]
    end
    # puts sum2

    # Sum up the squares
    squares1 = []
    shared_items.each do |k, v|
      squares1 << (prefs[person1][k] ** 2)
    end

    sum1Sq = 0
    squares1.each do |s|
      sum1Sq += s
    end
    # puts sum1Sq

    squares2 = []
    shared_items.each do |k, v|
      squares2 << (prefs[person2][k] ** 2)
    end

    sum2Sq = 0
    squares2.each do |s|
      sum2Sq += s
    end
    # puts sum2Sq

    # Sum up the products
    products = []
    shared_items.each do |k , v|
      products << (prefs[person1][k] * prefs[person2][k])
    end

    pSum = 0
    products.each do |p|
      pSum += p
    end

    # Calculate Pearson score
    num = (pSum - ((sum1 * sum2) / shared_items.size))
    den = Math.sqrt(((sum1Sq - (sum1 ** 2 / shared_items.size)) * (sum2Sq - (sum2 ** 2 / shared_items.size))))

    puts "num: #{num} | den: #{den}"

    if den == 0
      puts "Pearson Correlation: 0"
      return 0
    end

    pc = (num / den)
    puts "Pearson Correlation: #{pc}"

    pc
  end
end
