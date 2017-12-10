module AdventOfCode
  class FifthDay
    def self.part_one(file_path)
      keep_jumping(file_path) { 1 }
    end

    def self.part_two(file_path)
      keep_jumping(file_path) { |val| val >= 3 ? -1 : 1 }
    end

    def self.keep_jumping(file_path)
      list = File.read_lines(file_path).map { |l| l.to_i }
      jumps, pointer = 0, 0

      while true
        begin
          val = list[pointer]
          list[pointer] += yield val
          pointer += val
          jumps += 1
        rescue IndexError
          break
        end
      end

      jumps
    end
  end
end
