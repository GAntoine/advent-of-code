# input = File.read("./data/day_7.txt").scan(/.{1,150}/).map { |layer|
# 	{
# 		:zeros => layer.count('0'),
# 		:ones => layer.count('1'),
# 		:twos => layer.count('2')
# 	}
# }.min { |a, b| a[:zeros] <=> b[:zeros] }

# puts input[:ones] * input[:twos]

require 'matrix'

File.read("./data/day_7.txt").scan(/.{1,150}/).map { |layer|
	Matrix[*layer.scan(/.{1,25}/).map { |s| s.split("") }]
}.reduce(Matrix.build(6, 25) { "2" }) { |sum, matrix|
	matrix.each_with_index do |e, row, col|
		if sum[row, col] == "2"
			sum[row, col] = e
		end
	end

	sum
}.to_a.each {|r| puts r.inspect}
