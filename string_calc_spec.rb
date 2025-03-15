require 'rspec'
require_relative 'string_calc'

describe StringCalc do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalc.add("")).to eq(0)
    end
  end
end
