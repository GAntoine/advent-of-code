module AdventOfCode
  class FirstDay
    def self.part_one(captcha)
      chars = captcha.chars
      sum = 0

      chars.each_with_index do |char, index|
        i = char.to_i
        begin
          sum += i if i == chars[index + 1].to_i
        rescue IndexError
          sum += i if i == chars.first.to_i
        end
      end

      sum
    end
  end
end
