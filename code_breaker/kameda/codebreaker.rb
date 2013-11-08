# -*- encoding: utf-8 -*-


module Codebreaker
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
      matches, others = secret_ary.zip(guess_ary).partition {|sec, gue|
        sec == gue
      }
      match_count = matches.size
      other_secret_hash = Hash.new {|h,k| h[k] = 0}
      other_guesses = []
      others.each {|sec, gue|
        other_secret_hash[sec] += 1
        other_guesses << gue
      }

      hit_count = 0
      other_guesses.each {|gue|
        if other_secret_hash[gue] > 0
          hit_count += 1
          other_secret_hash[gue] -= 1
        end
      }
      ('+' * match_count) + ('-' * hit_count)
    end

  end
end

case $0
when __FILE__
  game = Codebreaker::Game.new(STDOUT)
  game.start('1234')
  while(code=gets.chomp)
    puts game.guess(code)
  end
when /spec[^\/]*$/
  # {spec of the implementation}
end


