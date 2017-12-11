require "./spec_helper"
require "../src/day_7"

describe AdventOfCode::SeventhDay do
  file_path = File.join(
    [
      File.dirname(__FILE__),
      "data",
      "day_7_input.txt",
    ]
  )

  describe "#part_one" do
    it "finds the name of the bottom program" do
      name = AdventOfCode::SeventhDay.part_one(file_path)
      name.should eq("hlqnsbe")
    end
  end

  describe "#part_two" do
    it "finds what its weight would need to be to balance the tree" do
      weight = AdventOfCode::SeventhDay.part_two(file_path)
      weight.should eq(1993)
    end
  end
end
