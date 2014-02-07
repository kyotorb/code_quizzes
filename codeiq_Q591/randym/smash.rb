class Smash

  DIGITS = %w(0 1 2 3 4 5 6 7 8 9).freeze
  VALID_RANGE = (1...5000).freeze
  DIGITS_REGEX = /(\d+).(\d+)/.freeze

  class << self

    def smallest_radicand with_characteristic = false
      VALID_RANGE.detect do |radicand|
        radicand_digits = digits_for radicand, with_characteristic
        (radicand_digits & DIGITS).size === DIGITS.size
      end
    end

    def digits_for radicand, with_characteristic
      Math.sqrt(radicand).to_s.match DIGITS_REGEX
      (with_characteristic ? $1 << $2 : $2).chars.take DIGITS.size
    end
  end
end

puts "平方根を小数で表したときに、0～9までの数字が最も早くすべて現れる最小の整数を求めてください。"
puts "整数部分を含む場合と、小数部分のみの場合のそれぞれについて求めてください。"
puts ""

puts "小数部分のみの場合"
smallest = Smash.smallest_radicand
puts "整数: " << smallest.to_s
puts "平方根: " << Math.sqrt(smallest).to_s
puts "数字: " << Smash.digits_for(smallest, false).inspect
puts ""

puts "整数を含む場合"
smallest = Smash.smallest_radicand true
puts "整数: " << smallest.to_s
puts "平方根: " << Math.sqrt(smallest).to_s
puts "数字: " << Smash.digits_for(smallest, true).inspect

# $ ruby smash.rb
# 平方根を小数で表したときに、0～9までの数字が最も早くすべて現れる最小の整数を求めてください。
# 整数部分を含む場合と、小数部分のみの場合のそれぞれについて求めてください。

# 小数部分のみの場合
# 整数: 143
# 平方根: 11.958260743101398
# 数字: ["9", "5", "8", "2", "6", "0", "7", "4", "3", "1"]

# 整数を含む場合
# 整数: 1362
# 平方根: 36.90528417449187
# 数字: ["3", "6", "9", "0", "5", "2", "8", "4", "1", "7"]
