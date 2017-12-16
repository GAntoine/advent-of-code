module AdventOfCode
  class NinthDay
    def self.part_one(file_path)
      score = 0
      group_depth = 0
      in_garbage = false
      skip_next = false

      chars = File.read(file_path).chars
      chars.each_with_index do |c, i|
        if skip_next
          skip_next = false
        elsif in_garbage && c == '!' && chars[i + 1] == '>'
          skip_next = true
        elsif in_garbage && c != '>'
          skip_next = c == '!'
        else
          case c
          when '{'
            group_depth += 1
          when '}'
            score += group_depth
            group_depth -= 1
          when '<'
            in_garbage = true
          when '>'
            in_garbage = false
          when '!'
            skip_next = true
          end
        end
      end
      score
    end

    def self.part_two(file_path)
      in_garbage = false
      skip_next = false
      caracters = 0

      chars = File.read(file_path).chars
      chars.each_with_index do |c, i|
        if skip_next
          skip_next = false
        elsif in_garbage && c == '!' && chars[i + 1] == '>'
          skip_next = true
        elsif in_garbage && c != '>'
          skip_next = c == '!'
          caracters += c == '!' ? 0 : 1
        else
          case c
          when '<'
            in_garbage = true
          when '>'
            in_garbage = false
          when '!'
            skip_next = true
          end
        end
      end
      caracters
    end
  end
end
