puts File.read("./data/day_1.txt").split.reduce(0) { |sum, line|
	def calc(x)
		return (x / 3).floor() - 2
	end

	m = calc(line.to_i)
	c = m

	loop do
		m = calc(m)
		m <= 0 ? break : c += m
	end

	sum + c
}
