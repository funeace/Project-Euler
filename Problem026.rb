# 単位分数とは分子が1の分数である. 分母が2から10の単位分数を10進数で表記すると次のようになる.
# 1/2 = 0.5
# 1/3 = 0.(3)
# 1/4 = 0.25
# 1/5 = 0.2
# 1/6 = 0.1(6)
# 1/7 = 0.(142857)
# 1/8 = 0.125
# 1/9 = 0.(1)
# 1/10 = 0.1
# 0.1(6)は 0.166666... という数字であり, 1桁の循環節を持つ. 1/7 の循環節は6桁ある.
# d < 1000 なる 1/d の中で小数部の循環節が最も長くなるような d を求めよ.


def felmer(num)
  # ここがわからなかった。　2 で割り切れるかつ、5で割り切れるものは除外
  num = num / 2 while num.even?
  num = num / 5 while num % 5 == 0
  return 0 if num == 1

  # 初期値を10 割り切れるように
  n = 10
  # count
  count = 1

  # n % num が 1になるまで繰り返す
  until n % num == 1
    # p num
    n = n * 10
    count += 1
  end
  count
end

max = [0, 0]

(1..1000).each do |i|
  count = felmer(i)
  if count > max[1]
    max = [i, count]
  end
end

puts max[0]