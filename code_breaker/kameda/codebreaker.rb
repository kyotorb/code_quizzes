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

      match_count = self.match_count(secret_ary, guess_ary)
      total_hit_count = self.total_hit_count(secret_ary, guess_ary)
      real_hit_count = total_hit_count - match_count

      ('+' * match_count) + ('-' * real_hit_count)
    end

    def total_hit_count(secret_ary, guess_ary_org)
      guess_ary = guess_ary_org.dup
      secret_ary.select {|char|
        i = guess_ary.index(char)
        if i
          guess_ary.delete_at(i)
          true
        else
          false
        end
      }.size
    end

    def match_count(secret_ary, guess_ary)
      secret_ary.zip(guess_ary).select {|sec, gue|
        sec == gue
      }.size
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


