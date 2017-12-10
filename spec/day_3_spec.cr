require "./spec_helper"
require "../src/day_3"

describe AdventOfCode::ThirdDay do
  square = 368078

  describe "#part_one" do
    it "sums of all digits that match the next digit in the list" do
      steps = AdventOfCode::ThirdDay.part_one(square)

      steps.should eq(371)
    end
  end

  describe "#part_two" do
    it "sums of all digits that match the digit halfway around" do
      steps = AdventOfCode::ThirdDay.part_two(square)

      steps.should eq(369601)
    end
  end
end
