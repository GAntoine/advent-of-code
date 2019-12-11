require 'matrix'
require 'set'

space = Matrix[*File.readlines("./data/day_10.txt").map { |s| s.split("")[0..-2] }]

best = [0, 0]
most = 0

(0..10).each do |x|
	(0..10).each do |y|
		next if space[x, y] != "#"

		positive = Set[]
		negative = Set[]

		(0..10).each do |tx|
			(0..10).each do |ty|
				next if space[tx, ty] != "#"
				next if ty === y && tx === x

				begin
					g = (tx - x) / (ty - y)
				rescue ZeroDivisionError => e
					g = Float::INFINITY
				end

				if tx > x || (tx === x && ty > y)
					positive.add(g)
				else
					negative.add(g)
				end
			end
		end

		n = positive.size + negative.size;
		if n > most
			most = n
			best = [x, y]

		end
	end
end

puts most
