require 'bigdecimal'

results = {}
results_all = {}
(0..9).each do |num|
  sqrt = BigDecimal.new(num.to_s).sqrt(50)
  i, f = sqrt.to_s('F').split('.')
puts "num=#{num}, sqrt=#{i}.#{f}"
  nums = {}
  f.chars.each_with_index do |e, idx|
    nums[e] = 1
    if nums.size == 10
      results[num] = idx+1
      break
    end
  end
  nums = {}
  (i+f).chars.each_with_index do |e, idx|
    nums[e] = 1
    if nums.size == 10
      results_all[num] = idx+1
      break
    end
  end
end

puts
p results
p results_all

