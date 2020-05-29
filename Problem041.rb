# n桁パンデジタルであるとは, 1からnまでの数を各桁に1つずつ持つこととする.
# #下のリンク先にあるような数学的定義とは異なる
# 例えば2143は4桁パンデジタル数であり,
# かつ素数である. n桁（この問題の定義では9桁以下）パンデジタルな素数の中で最大の数を答えよ.


require 'prime'

# def prime?(num)
#   (2..num).each do |i|
#     if num % i == 0 && num == i
#       pandegital?(num)
#     elsif num % i == 0
#       return false
#     end
#   end
# end


def pandegital?(num)
  chk_num = num.to_s.split("").sort!
  chk_arr = (1..chk_num.size).to_a

  chk_arr == chk_num ? true : false
end

answer = []


(1000000..1000000000).each do |i|
  if i % 2 != 0 && Prime.prime?(i) && pandegital?(i)
    p answer.push(i)
  end
end


p answer.max
