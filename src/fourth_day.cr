module AdventOfCode
  class FourthDay
    def self.part_one(file_path)
      File.read_lines(file_path).reduce(0) do |acc, line|
        line.split
            .group_by { |l| l }
            .reject { |k, v| v.size == 1 }
            .size > 0 ? acc : acc + 1
      end
    end

    def self.part_two(file_path)
    end
  end
end
