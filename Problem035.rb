# 197は巡回素数と呼ばれる. 桁を回転させたときに得られる数 197, 971, 719 が全て素数だからである.
# 100未満には巡回素数が13個ある: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, および97である.
# 100万未満の巡回素数はいくつあるか?

# 素数を求めるメソッド(重かったのでprimeメソッドで代用)
# def prime(num)
#   if num == 1
#     return false
#   end
#   (2..num).each do |i|
#     if num % i == 0 && num == i
#       return true
#     elsif num % i == 0
#       return false
#     end
#   end
# end

require 'prime'
@prime_array = []

# rotateした結果を配列に投入し、全部素数か判定するメソッド
def patrol(num)
  patrol = num.to_s.split("")
  result = (1..patrol.length).map{|i|patrol.rotate(i).join.to_i}.uniq
  result_array = []
  # 判定用
  result.each do |i|
    result_array.push(Prime.prime?(i))
  end
    @prime_array.push(num) unless result_array.include?(false)
end

# 2~999999までloopを回し1個ずつ判定
(2..999999).each do |num|
  patrol(num)
end

p @prime_array.uniq.length