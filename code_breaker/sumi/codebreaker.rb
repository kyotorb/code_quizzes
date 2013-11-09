class String
	def fill(char, range)
		self.each_char.to_a.tap {|target|
				target.fill(char, range)
		}.join
	end
end

module Codebreaker
	class Game
		def initialize(output)
			@output = output
		end

		def start(secret)
			@secret = secret.each_char.to_a
			@output.puts "Welcome to Codebreaker!"
			@output.puts "Enter guess: "
		end

		def guess(numbers)
			@numbers = numbers.each_char.to_a

			('+' * total_count).fill('-', hit_count..-1)
		end

	private
		def total_count
			(0..9).map(&:to_s).reduce(0) do |count, n|
				count + [@secret.count(n), @numbers.count(n)].min
			end
		end

		def hit_count
			@secret.each_index.reduce(0) do |count, idx|
				count + (@secret[idx] == @numbers[idx] ? 1 : 0)
			end
		end
	end
end
