require 'rspec'
require_relative 'string_calc'

describe StringCalc do
  describe ".add" do
    # When empty string is passed the add method should return 0
    it "returns 0 for an empty string" do
      expect(StringCalc.add("")).to eq(0)
    end

    # When a single number is passed then the number itself should be returned
    it "returns the number itself when only one number is provided" do
      expect(StringCalc.add("1")).to eq(1)
      expect(StringCalc.add("12")).to eq(12)
      expect(StringCalc.add("395")).to eq(395)
      expect(StringCalc.add("395234")).to eq(395234)  
    end

    # Retruns the sum of both numbers if 2 numbers are passed using a comma as a delimiter
    it "returns the sum of two numbers" do
      expect(StringCalc.add("1,2")).to eq(3)
      expect(StringCalc.add("15,25")).to eq(40)
      expect(StringCalc.add("1123,562")).to eq(1685)
    end
  end
end
