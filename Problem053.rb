# 12345から3つ選ぶ選び方は10通りである.
# 123, 124, 125, 134, 135, 145, 234, 235, 245, 345.
# 組み合わせでは, 以下の記法を用いてこのことを表す: 5C3 = 10.
# 一般に, r ≤ n について nCr = n!/(r!(n-r)!) である. ここで, n! = n×(n−1)×...×3×2×1, 0! = 1 と階乗を定義する.
# n = 23 になるまで, これらの値が100万を超えることはない: 23C10 = 1144066.
# 1 ≤ n ≤ 100 について, 100万を超える nCr は何通りあるか?

# p (5 * 4 * 3) / (3 * 2 * 1)

def kaizyo(num)
  # # 5C3 であったら num * num -1 * num -2 / 1 * 2 * 3
  # n!/(r!(n-r)!)
  # (1..num).each do |i|
  # とりあえずn!
  (2..num).inject(1){|sum, item| sum * item}
end

numbers_ary = []

(1..100).each do |n|
  (1..n).each do |r|
  up = kaizyo(n) / (kaizyo(r) * kaizyo(n-r))
    if up >= 1000000
      numbers_ary.push(up)
    end
  end
end

p numbers_ary.size