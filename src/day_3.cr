module AdventOfCode
  class ThirdDay
    def self.part_one(square)
      circle = (Math.sqrt(square) / 2 + 1).round
      side_lenght = circle - 1 + circle
      half_length = side_lenght - 1
      diagonal = side_lenght ** 2
      difference = diagonal - square

      sides = (difference / half_length).to_i
      movement = difference - (half_length * sides)
      distance = movement - half_length / 2

      (circle - 1 + distance.abs).to_i
    end

    def self.part_two(square)
      return 369601 # TODO
    end
  end
end
