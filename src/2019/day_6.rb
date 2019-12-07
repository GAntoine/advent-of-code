data = {}

input = File.read("./data/day_6.txt").split("\n").map { |x| x.split(")") }
input.each { |x| data[x[1]] = x[0] }

puts input.reduce(0) { |sum, orbit|
	key = orbit[0]
	orbits = 1

	loop do
		if data.key?(key)
			key = data[key]
			orbits += 1
		else
			break
		end
	end

	sum + orbits
}

def calc_path(data, key, path)
	loop do
		if data.key?(key)
			path.push(key)
			key = data[key]
		else
			break
		end
	end
end

you_path = []
calc_path(data, data['YOU'], you_path)

san_path = []
calc_path(data, data['SAN'], san_path)

meet = san_path.map { |x| you_path.find { |y| x == y } }.compact[0]
puts (you_path.count - 1 - you_path.reverse.find_index(meet)) + (san_path.count - 1 - san_path.reverse.find_index(meet))
