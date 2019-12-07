input = File.read("./data/day_5.txt").split(",").map(&:to_i)

(0..99).each do |a|
	(0..99).each do |b|
		x = 0

		program = input.dup()
		program[1] = a
		program[2] = b

		loop do
			break if program[x] == 99

			if program[x] == 1
				c = program[program[x + 1]] + program[program[x + 2]]
				program[program[x + 3]] = c
			elsif program[x] == 2
				c = program[program[x + 1]] * program[program[x + 2]]
				program[program[x + 3]] = c
			elsif program[x] == 3
				program[program[x + 1]] = 1
			elsif program[x] == 4
				puts program[program[x + 1]]
			end

			x += 4
		end

		puts 100 * a + b if program[0] == 19690720
	end
end

