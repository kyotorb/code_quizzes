require 'set'

module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret.each_char.to_a
      @output.puts("Welcome to Codebreaker!")
      @output.puts("Enter guess: ")
    end
    
    def guess(numbers)
      ("+" * hit_count(numbers)) + ("-" * match_count(numbers))
    end

    def hit_count(numbers)
      numbers.each_char.zip(@secret).count{|n, s| s == n }
    end

    def match_count(numbers)
      (Set.new(numbers.each_char) & @secret).size - hit_count(numbers)
    end
  end
end
