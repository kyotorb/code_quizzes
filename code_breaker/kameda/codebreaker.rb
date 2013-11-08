# -*- encoding: utf-8 -*-


module Enumerable
  def sum
    self.inject(0) {|memo,i| memo + i}
  end
end

class Object
  def try(message)
    self.nil? ? nil : self.send(message)
  end
end

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
      real_hit_count = self.total_hit_count(secret_ary, guess_ary) - match_count

      ('+' * match_count) + ('-' * real_hit_count)
    end

    def total_hit_count(secret_ary, guess_ary)
      secret_hash = secret_ary.group_by {|char| char} # {要素 => 要素数} というハッシュを作りたい
      guess_hash = guess_ary.group_by {|char| char}
      secret_hash.map {|key, chars|
        secret_count = chars.size
        guess_count = guess_hash[key].try(:size).to_i
        [secret_count, guess_count].min
      }.sum
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


