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

    numbers.split(/#{delimiter}|,|\n/).map(&:to_i).sum
  end
end
