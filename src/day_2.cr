module AdventOfCode
  class SecondDay
    def self.part_one(file_path)
      spreadsheet = build_spreadsheet(file_path)
      spreadsheet.reduce(0) { |acc, arr| acc + (arr.max - arr.min) }
    end

    def self.part_two(file_path)
      spreadsheet = build_spreadsheet(file_path)
      spreadsheet.reduce(0) do |acc, arr|
        sorted = arr.sort
        divident, divisor = [] of Int32, 1

        sorted.each_with_index do |elem, i|
          divisor = elem
          divident = sorted
            .last(sorted.size - (i + 1))
            .select { |sortee| sortee % elem == 0 }
          break if divident.any?
        end

        acc + divident.first / divisor
      end
    end

    def self.build_spreadsheet(file_path)
      spreadsheet = File.read_lines(file_path).map { |l| l.split.map { |w| w.to_i } }
    end
  end
end
