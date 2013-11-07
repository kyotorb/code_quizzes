# -*- encoding: utf-8 -*-


class Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
    end

    def guess(guess)
      secret_ary = @secret.split(//)
      guess_ary = guess.split(//)
      pluses, others = secret_ary.zip(guess_ary).partition {|sec, gue|
        sec == gue
      }
      plus_count = pluses.size

      other_secret_hash = Hash.new {|h,k| h[k] = 0}
      other_guesses = []
      others.each {|sec, gue|
        other_secret_hash[sec] += 1
        other_guesses << gue
      }
      minus_count = 0
      other_guesses.each {|gue|
        if other_secret_hash[gue] > 0
          minus_count += 1
          other_secret_hash[gue] -= 1
        end
      }
      ('+' * plus_count) + ('-' * minus_count)
    end

  end
end

case $0
when __FILE__
  main
when /spec[^\/]*$/
  # {spec of the implementation}
end


