class StringCalc
  def self.add(numbers)
    return 0 if numbers.empty?

    # Regex accepts comma and new line as a delimiter
    numbers.split(/,|\n/).map(&:to_i).sum
  end
end
