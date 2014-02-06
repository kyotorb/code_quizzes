result = nil
result_full = nil
n = 2
loop do
  i, f = Math.sqrt(n).to_s.split('.')
  result ||= n if f.chars[0..9].uniq.size == 10
  result_full ||= n if (i+f).chars[0..9].uniq.size == 10

  break if result && result_full
  n += 1
end
puts "only decimal place : #{result} / sqrt=#{Math.sqrt(result).to_s}"
puts "full number chars  : #{result_full} / sqrt=#{Math.sqrt(result_full).to_s}"


#=> only decimal place : 143 / sqrt=11.958260743101398
#=> full number chars  : 1362 / sqrt=36.90528417449187

