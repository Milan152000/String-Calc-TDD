class StringCalc
  def self.add(numbers)
    return 0 if numbers.empty?

    # Supports custom delimiters where the starting of the numbers input is //
    delimiter = ",|\n"
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2]
      numbers = parts[1]
    end

    # Raise an exception and return negative numbers if any negative numbers are encountered
    num_array = numbers.split(/#{delimiter}|,|\n/).map(&:to_i)
    negatives = num_array.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?

    num_array.sum
  end
end
