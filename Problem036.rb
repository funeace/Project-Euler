# 585 = 10010010012 (2進) は10進でも2進でも回文数である.
# 100万未満で10進でも2進でも回文数になるような数の総和を求めよ.
# (注: 先頭に0を含めて回文にすることは許されない.)

answer = 0

(1..1000000).each do |num|
  chk_num = num
  parindrome_array = []

  next if num.to_s != num.to_s.reverse

  while num > 0
    calc_result = num.divmod(2)
    parindrome_array.push(calc_result[1])
    num = calc_result[0]
  end

  if parindrome_array.join.to_i == parindrome_array.reverse.join.to_i
    answer += chk_num
  end
end

p answer