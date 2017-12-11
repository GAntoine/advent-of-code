require "./spec_helper"
require "../src/day_3"

describe AdventOfCode::ThirdDay do
  square = 368078

  describe "#part_one" do
    it "returns the number of steps required" do
      steps = AdventOfCode::ThirdDay.part_one(square)

      steps.should eq(371)
    end
  end

  describe "#part_two" do
    it "returns the first value written that is larger than the puzzle input" do
      first_value = AdventOfCode::ThirdDay.part_two(square)

      first_value.should eq(369601)
    end
  end
end
