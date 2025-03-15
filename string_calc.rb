class StringCalc
  def self.add(numbers)
    return 0 if numbers.empty?

    # Supports custom long delimiters where the starting of the numbers input is //
    delimiter = ",|\n"
    if numbers.start_with?("//")
      custom_delimiter_section, numbers = numbers.split("\n", 2)
      
      # Check for long custom delimiters inside []
      if custom_delimiter_section.include?("[")
        delimiter = custom_delimiter_section.scan(/\[([^\]]+)\]/).flatten.map { |d| Regexp.escape(d) }.join("|")
      else
        delimiter = Regexp.escape(custom_delimiter_section[2]) # Single character delimiter
      end
    end

    # Raise an exception and return negative numbers if any negative numbers are encountered
    num_array = numbers.split(/#{delimiter}|,|\n/).map(&:to_i)
    negatives = num_array.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?

    # Reject numbers greater than 1000 and add other numbers
    num_array.reject { |num| num > 1000 }.sum
  end
end
