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
			@hit_count = nil

			'+' * hit_count + '-' * match_count
		end

	private
		def total_count
			(0..9).map(&:to_s).reduce(0) do |count, n|
				count + [@secret.count(n), @numbers.count(n)].min
			end
		end

		def hit_count
			@hit_count ||= @secret.each_index.reduce(0) do |count, idx|
				count + (@secret[idx] == @numbers[idx] ? 1 : 0)
			end
		end

		def match_count
			total_count - hit_count
		end
	end
end
