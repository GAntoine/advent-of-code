module AdventOfCode
  class EightDay
    def self.part_one(file_path)
      complete(file_path) { }
    end

    def self.part_two(file_path)
      highest_value = 0
      complete(file_path) { |reg| highest_value = reg if reg > highest_value }
      highest_value
    end

    def self.complete(file_path)
      dictionary = {} of String => Int32

      File.each_line(file_path) do |line|
        register, direction, value, x, variable, operator, operand = line.split

        value = value.to_i
        operand = operand.to_i

        dictionary[register] = 0 unless dictionary.has_key? register
        dictionary[variable] = 0 unless dictionary.has_key? variable

        condition = case operator
                    when "=="
                      dictionary[variable] == operand
                    when "!="
                      dictionary[variable] != operand
                    when ">"
                      dictionary[variable] > operand
                    when "<"
                      dictionary[variable] < operand
                    when ">="
                      dictionary[variable] >= operand
                    when "<="
                      dictionary[variable] <= operand
                    else
                      false
                    end

        next unless condition

        dictionary[register] += direction == "inc" ? value : -value
        yield dictionary[register]
      end

      dictionary.max_by { |k, v| v }.last
    end
  end
end
