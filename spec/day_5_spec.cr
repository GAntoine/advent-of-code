require "./spec_helper"
require "../src/day_5"

describe AdventOfCode::FifthDay do
  file_path = File.join(
    [
      File.dirname(__FILE__),
      "data",
      "day_5_input.txt",
    ]
  )

  describe "#part_one" do
    it "returns the number of steps to reach the exit" do
      jumps = AdventOfCode::FifthDay.part_one(file_path)

      jumps.should eq(372139)
    end
  end

  describe "#part_two" do
    it "sums of all digits that match the digit halfway around" do
      jumps = AdventOfCode::FifthDay.part_two(file_path)

      jumps.should eq(29629538)
    end
  end
end
