# 3797は面白い性質を持っている. 
# まずそれ自身が素数であり, 
# 左から右に桁を除いたときに全て素数になっている (3797, 797, 97, 7). 同様に右から左に桁を除いたときも全て素数である (3797, 379, 37, 3).
# 右から切り詰めても左から切り詰めても素数になるような素数は11個しかない. 総和を求めよ.
# 注: 2, 3, 5, 7を切り詰め可能な素数とは考えない.

require 'prime'

debug = []
answer = 0
(11..800000).each do |num|
  next if num % 2 == 0 || num.to_s.include?("0")
  num_chk = []
  num.to_s.split("").each_with_index do |num_char,ind|
  chk_number = num.to_s.split("")[ind..num.to_s.length].join.to_i
  chk_number_reverse = num.to_s.reverse.split("")[ind..num.to_s.length].reverse.join.to_i
  num_chk.push([chk_number,Prime.prime?(chk_number),chk_number_reverse,Prime.prime?(chk_number_reverse)])
end

  # p num_chk.flatten
  unless num_chk.flatten.include?(false)
    if debug.include?(num.to_s.reverse.to_i) == false
      # p "#{debug.include?(num.to_s.reverse.to_i)}------------ #{num}"
      debug.push(num_chk[0][0])
    end
  end
end
 p debug
 p debug.sum