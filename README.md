# String-Calc-TDD

**Overview:-**

This is a simple String Calculator implemented in Ruby, following the Test-Driven Development (TDD) approach. The calculator takes a string of numbers separated by delimiters (,, \n, or custom ones) and returns their sum.


**Features:-**

1. Returns 0 for an empty string.
2. Supports default delimiters (, and \n).
3. Allows custom delimiters (//[delimiter]\n syntax).
4. Supports long delimiters (//[***]\n1***2***3 → 6).
5. Handles multiple custom delimiters (//[*][%]\n1*2%3 → 6).
6. Raises an exception for negative numbers ("Negatives not allowed: -1, -2").
7. Ignores numbers greater than 1000 ("1001,2" → 2).


**Usage:-** Run the Ruby script:

require_relative 'string_calc'

puts StringCalc.add("1,2,3")  # Output: 6

Example Test Cases:

1. StringCalc.add("")                  # => 0
2. StringCalc.add("1,2,3")             # => 6
3. StringCalc.add("1\n2,3")          # => 6
4. StringCalc.add("//;\n1;2;3")    # => 6
5. StringCalc.add("//[***]\n1***2***3")  # => 6
6. StringCalc.add("//[*][%]\n1*2%3")  # => 6
7. StringCalc.add("1001,2")          # => 2

**Test-Driven Development (TDD):-** 
Step by step approach

1. Write a failing test (RSpec)
2. Write the minimum code to pass the test.
3. Refactor the code for efficiency
4. Running Tests
   
**Install RSpec (if not installed):-**
gem install rspec

**Run tests:-**
rspec string_calc_spec.rb
