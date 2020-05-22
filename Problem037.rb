# 3797は面白い性質を持っている. 
# まずそれ自身が素数であり, 
# 左から右に桁を除いたときに全て素数になっている (3797, 797, 97, 7). 同様に右から左に桁を除いたときも全て素数である (3797, 379, 37, 3).
# 右から切り詰めても左から切り詰めても素数になるような素数は11個しかない. 総和を求めよ.
# 注: 2, 3, 5, 7を切り詰め可能な素数とは考えない.

require 'prime'


answer = 0
(3797..3797).each do |num|
  num_chk = []
  num.to_s.split("").each_with_index do |num_char,ind|
    chk_number = num.to_s.split("")[ind..-1].join.to_i
    chk_number_reverse = num.to_s.reverse.split("")[ind+1..-1].join.to_i
    num_chk.push([chk_number,Prime.prime?(chk_number),chk_number_reverse,Prime.prime?(chk_number_reverse)])
  end



  # p num_chk.flatten
  p num_chk.flatten
  unless num_chk.flatten.include?(false)
    p num_chk.flatten
    p answer = answer + num_chk[0][0]
  end
end
  p answer