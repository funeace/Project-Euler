# 驚くべきことに, 各桁を4乗した数の和が元の数と一致する数は3つしかない.

# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# ただし, 1=14は含まないものとする. この数たちの和は 1634 + 8208 + 9474 = 19316 である.

# 各桁を5乗した数の和が元の数と一致するような数の総和を求めよ.
result = 0

(2..999999).each do |number|
  num = number.to_s.split("").map(&:to_i)
  calc_result = 0
  p num
  num.each do |n|
    # p n ** 5
    calc_result += n ** 5
  end

  if number == calc_result
    result =  number + result
  end
end

puts result