require "./spec_helper"
require "../src/day_8"

describe AdventOfCode::EightDay do
  file_path = File.join(
    [
      File.dirname(__FILE__),
      "data",
      "day_8_input.txt",
    ]
  )

  describe "#part_one" do
    it "finds the largest value in any register" do
      name = AdventOfCode::EightDay.part_one(file_path)
      name.should eq(5102)
    end
  end

  describe "#part_two" do
    it "finds the highest value held in any register during this process" do
      weight = AdventOfCode::EightDay.part_two(file_path)
      weight.should eq(6056)
    end
  end
end
