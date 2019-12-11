require 'matrix'

space = Matrix[*File.readlines("./data/day_10.txt").map { |s| s.split("")[0..-2] }]

space.each_with_index.map do |x, row, col|
	count = 0
	space.each_with_index.map do |y, subrow, subcol|
		continue if row == subrow && col == subcol

		horizontal = [col..subcol]
	end
end
