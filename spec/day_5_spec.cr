require "./spec_helper"
require "../src/day_5"

describe AdventOfCode::FifthDay do
  describe "#part_one" do
    it "returns the number of steps to reach the exit" do
      sum = AdventOfCode::FifthDay.part_one

      sum.should eq(0)
    end
  end

  describe "#part_two" do
    it "sums of all digits that match the digit halfway around" do
      sum = AdventOfCode::FifthDay.part_two

      sum.should eq(0)
    end
  end
end
