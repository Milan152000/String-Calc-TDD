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
      expect(StringCalc.add("999")).to eq(999)  
    end

    # Retruns the sum of both numbers if 2 numbers are passed using a comma as a delimiter
    it "returns the sum of two numbers" do
      expect(StringCalc.add("1,2")).to eq(3)
      expect(StringCalc.add("15,25")).to eq(40)
      expect(StringCalc.add("100,200")).to eq(300)
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
      expect(StringCalc.add("100\n200,300")).to eq(600)
    end

    # accepts custom delimiters like comma, semicolon, new line all together
    it "accepts custom delimiters and returns the sum of numbers" do
      expect(StringCalc.add("//;\n1;2")).to eq(3)
      expect(StringCalc.add("//-\n10-20-30")).to eq(60)
      expect(StringCalc.add("//#\n100#200#300")).to eq(600)
    end

    # Raises an exception if any negative numbers are passed
    it "raises an exception for negative numbers" do
      expect { StringCalc.add("1,-2,3,-4") }.to raise_error(RuntimeError, "negatives not allowed: -2, -4")
    end

    # Ignores the numbers greater than 1000
    it "ignores numbers greater than 1000" do
      expect(StringCalc.add("2,1001")).to eq(2)
      expect(StringCalc.add("2,3,1001,50,3000")).to eq(55)
      expect(StringCalc.add("2,1500,100,200,2000")).to eq(302)
    end

    # Accept long custom delimiters
    it "supports long custom delimiters" do
      expect(StringCalc.add("//[***]\n1***2***3")).to eq(6)
      expect(StringCalc.add("//[***]\n10***20***30***1500")).to eq(60)
    end

    # When the custom delimiter is the * symbol then we have to multiply the numbers
    it "returns the multiplication of all the numbers passed with delimiter *" do
      expect(StringCalc.add("//*\n2*3*4")).to eq(24)
      expect(StringCalc.add("//[*]\n2*3*4")).to eq(24)
    end
  end
end
