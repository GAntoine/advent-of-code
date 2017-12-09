module AdventOfCode
  class FirstDay
    def self.part_one(captcha)
      chars = captcha.chars
      sum = 0

      chars.each_with_index do |char, index|
        val = char.to_i
        begin
          sum += val if val == chars[index + 1].to_i
        rescue IndexError
          sum += val if val == chars.first.to_i
        end
      end

      sum
    end

    def self.part_two(captcha)
      chars = captcha.chars
      half = chars.size/2
      sum = 0

      chars.each_with_index do |char, index|
        val = char.to_i
        begin
          sum += val if val == chars[half + index].to_i
        rescue IndexError
          sum += val if val == chars[index - half].to_i
        end
      end

      sum
    end
  end
end
