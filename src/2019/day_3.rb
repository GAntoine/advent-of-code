alpha, beta = File.read("./data/day_3.txt").split().map { |l| l.split(",") }
intersections = []

Point = Struct.new(:x, :y)

def ccw(gamma, delta, epsilon)
	(epsilon.y - gamma.y) * (delta.x - gamma.x) > (delta.y - gamma.y) * (epsilon.x - gamma.x)
end

def intersects(a, b, c, d)
	ccw(a, c, d) != ccw(b, c, d) and ccw(a, b, c) != ccw(a, b, d)
end

last_alpha_point = Point.new(0, 0)
last_beta_point = Point.new(0, 0)

def get_next_point(line, last)
	l = line.clone()

	direction = l[0]
	l[0] = ''
	l = l.to_i

	if direction == "R"
		return Point.new(last.x + l, last.y)
	elsif direction == "L"
		return  Point.new(last.x - l, last.y)
	elsif direction == "U"
		return  Point.new(last.x, last.y + l)
	elsif direction == "D"
		return  Point.new(last.x, last.y - l)
	end
end

alpha.each do |a|
	alpha_point = get_next_point(a, last_alpha_point)
	last_beta_point = Point.new(0, 0)

	beta.each do |b|
		beta_point = get_next_point(b, last_beta_point)

		if intersects(last_alpha_point, alpha_point, last_beta_point, beta_point)
			if last_alpha_point.x == alpha_point.x
				intersections.push(Point.new(alpha_point.x, beta_point.y))
			else
				intersections.push(Point.new(beta_point.x, alpha_point.y))
			end
		end

		last_beta_point = beta_point
	end

	last_alpha_point = alpha_point
end

puts intersections.map { |p| p.x.abs + p.y.abs }.min
