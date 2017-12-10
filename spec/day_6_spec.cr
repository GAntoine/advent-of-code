require "./spec_helper"
require "../src/day_6"

describe AdventOfCode::SixthDay do
  test_banks = [0, 2, 7, 0]
  banks = [2, 8, 8, 5, 4, 2, 3, 1, 5, 5, 1, 2, 15, 13, 5, 14]

  describe "#part_one" do
    it "calcualtes the number of redistribution cycles" do
      test_cycles = AdventOfCode::SixthDay.part_one(test_banks)
      test_cycles.should eq(5)

      cycles = AdventOfCode::SixthDay.part_one(banks)
      cycles.should eq(3156)
    end
  end

  describe "#part_two" do
    it "sums of all digits that match the digit halfway around" do
      test_cycles = AdventOfCode::SixthDay.part_two(test_banks)
      test_cycles.should eq(4)

      cycles = AdventOfCode::SixthDay.part_two(banks)
      cycles.should eq(1610)
    end
  end
end
