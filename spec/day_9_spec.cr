require "./spec_helper"
require "../src/day_9"

describe AdventOfCode::NinthDay do
  file_path = File.join(
    [
      File.dirname(__FILE__),
      "data",
      "day_9_input.txt",
    ]
  )

  describe "#part_one" do
    it "calculates the total score for all groups in your input" do
      score = AdventOfCode::NinthDay.part_one(file_path)
      score.should eq(0)
    end
  end

  describe "#part_two" do
    it "calculates how many non-canceled characters are within the garbage" do
      score = AdventOfCode::NinthDay.part_two(file_path)
      score.should eq(0)
    end
  end
end
