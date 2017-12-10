require "digest"

module AdventOfCode
  class SixthDay
    def self.part_one(banks)
      loop_over(banks) do |lookup, h|
        {lookup.has_key?(h), 1, 1}
      end
    end

    def self.part_two(banks)
      loop_over(banks) do |lookup, h|
        if lookup.has_key?(h)
          do_break = lookup[h] > 1
          {do_break, lookup[h] + 1, do_break ? 0 : 1}
        else
          {false, 1, 0}
        end
      end
    end

    def self.loop_over(banks)
      lookup = {} of String => Int32
      loops = 0

      while true
        index = banks.index(banks.max) || 0
        spread = banks[index]
        banks[index] = 0

        (0..spread - 1).each do |_x|
          index += 1
          index = 0 if index >= banks.size
          banks[index] = banks[index] + 1
        end

        hash = Digest::SHA1.hexdigest(banks.join)
        do_break, new_val, increment_by = yield(lookup, hash)

        loops += increment_by
        break if do_break
        lookup[hash] = new_val
      end

      loops
    end
  end
end
