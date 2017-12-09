module AdventOfCode
  class SecondDay
    def self.part_one(spreadsheet)
      spreadsheet.reduce(0) { |acc, arr| acc + (arr.max - arr.min) }
    end

    def self.part_two(spreadsheet)
      spreadsheet.reduce(0) do |acc, arr|
        sorted = arr.sort
        divident, divisor = 0, 1

        sorted.each_with_index do |elem, i|
          divisor = elem
          divident = sorted
            .last(sorted.size - (i + 1))
            .find { |sortee| sortee % elem == 0 }
          break if divident
        end

        acc + (divident || 0) / divisor
      end
    end
  end
end
