require "./spec_helper"
require "../src/day_4"

describe AdventOfCode::FourthDay do
  file_path = File.join(
    [
      File.dirname(__FILE__),
      "data",
      "passphrases.txt",
    ]
  )

  describe "#part_one" do
    it "checks how many passphrases are valid" do
      count = AdventOfCode::FourthDay.part_one(file_path)

      count.should eq(386)
    end
  end

  describe "#part_two" do
    it "" do
      sum = AdventOfCode::FourthDay.part_two(file_path)

      sum.should eq(208)
    end
  end
end
