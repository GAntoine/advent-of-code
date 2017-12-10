require "./spec_helper"
require "../src/day_2"

describe AdventOfCode::SecondDay do
  file_path = File.join(
    [
      File.dirname(__FILE__),
      "data",
      "day_2_input.txt",
    ]
  )

  describe "#part_one" do
    it "calculates the spreadsheet's checksum" do
      checksum = AdventOfCode::SecondDay.part_one(file_path)

      checksum.should eq(50376)
    end
  end

  describe "#part_two" do
    it "calculates the sum of each row's result" do
      checksum = AdventOfCode::SecondDay.part_two(file_path)

      checksum.should eq(267)
    end
  end
end
