require 'set'
require 'digest/sha1'

Position = Struct.new(:x, :y, :z)
Velocity = Struct.new(:x, :y, :z)
Moon = Struct.new(:p, :v)

positions = Set[]

moons = File.read("./data/day_12.txt").split("\n").map { |x|
	x.match(/\<x\=(\-?\d+), y\=(\-?\d+), z\=(\-?\d+)\>/).captures
}.map { |x| Moon.new(Position.new(*x.map(&:to_i)), Velocity.new(0, 0, 0)) }

count = 1
loop do
	moons.each_with_index do |m, mi|
		moons.each_with_index do |n, ni|
			next if mi == ni

			m.v.x = m.p.x > n.p.x ? m.v.x - 1 : m.p.x < n.p.x ? m.v.x + 1 : m.v.x
			m.v.y = m.p.y > n.p.y ? m.v.y - 1 : m.p.y < n.p.y ? m.v.y + 1 : m.v.y
			m.v.z = m.p.z > n.p.z ? m.v.z - 1 : m.p.z < n.p.z ? m.v.z + 1 : m.v.z
		end
	end

	moons.each_with_index do |m|
		m.p.x += m.v.x
		m.p.y += m.v.y
		m.p.z += m.v.z
	end

	digest = Digest::SHA1.hexdigest(moons.map { |m| m.p }.to_s)
	break if positions.include?(digest)

	positions.add(digest)
	count += 1
end

puts count
# puts moons.reduce(0) { |acc, m|
# 	acc + ((m.p.x.abs + m.p.y.abs + m.p.z.abs) * (m.v.x.abs + m.v.y.abs + m.v.z.abs))
# }
