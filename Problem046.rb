# Christian Goldbachは全ての奇合成数は平方数の2倍と素数の和で表せると予想した.
# 9 = 7 + 2×1 ** 2
# 15 = 7 + 2×2 ** 2
# 21 = 3 + 2×3 ** 2
# 25 = 7 + 2×3 ** 2
# 27 = 19 + 2×2 ** 2
# 33 = 31 + 2×1 ** 2
# 後に, この予想は誤りであることが分かった.
# 平方数の2倍と素数の和で表せない最小の奇合成数はいくつか?

# require 'prime'

# # とりあえず記号整数の配列を作る
# odd_numbers = (1..10000).select{|i| i.odd? }


# # 以下の値を１個ずつ検証できるか調査すればいい
# p odd_numbers

# odd_numbers.each do |i|

# end


# 以下回答
require 'prime'

max = 100000
# 3から2ずつ追加していき、奇数の配列を作成。この時、素数を除外
nums = 3.step(max, 2).reject {|v| Prime.prime?(v) }

# 奇数の配列をループ
nums.each do |n|
  flag = false
  # nまでの素数表を作成し、それぞれでloop
  Prime.each(n) do |p|
    if Math.sqrt((n - p) / 2) % 1 == 0
      flag = true
      break
    end
  end
  unless flag
    p n
    exit
  end
end