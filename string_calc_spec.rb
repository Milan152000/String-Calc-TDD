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

    # Returns the sum of all the numbers passed comma separated
    it "returns the sum of multiple numbers" do
      expect(StringCalc.add("1,2,3,4")).to eq(10)
      expect(StringCalc.add("5,6,7,8,9,10")).to eq(45)
      expect(StringCalc.add("100,200,500,1000")).to eq(1800)
    end

    # Accept new line as a delimiter between numbers
    it "accepts new line \n as a delimiter between numbers" do
      expect(StringCalc.add("1\n2,3")).to eq(6)
      expect(StringCalc.add("10\n20,30")).to eq(60)
      expect(StringCalc.add("100\n1000,2000")).to eq(3100)
    end

    # accepts custom delimiters like comma, semicolon, new line all together
    it "accepts custom delimiters and returns the sum of numbers" do
      expect(StringCalc.add("//;\n1;2")).to eq(3)
      expect(StringCalc.add("//-\n10-20-30")).to eq(60)
      expect(StringCalc.add("//#\n100#200#300")).to eq(600)
    end
  end
end
