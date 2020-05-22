# 辺の長さが {a,b,c} と整数の3つ組である直角三角形を考え,
# その周囲の長さを p とする. p = 120のときには3つの解が存在する:
# {20,48,52}, {24,45,51}, {30,40,50}
# p ≤ 1000 のとき解の数が最大になる p はいくつか?
# 三平方の定理 a**2 + b ** 2 + c **2より、n = a + b + c
# c = n - (a + b)
# b = (2 * a * n - n**2) / ( 2 * a - 2 * n) => n - n^2 / (2n - 2a)
# ピタゴラス数の公式を使うと必ず整数になる
# (a, b, c) = (m2 − n2, 2mn, m2 + n2) or (2mn, m2 − n2, m2 + n2)
# http://tsumuji.cocolog-nifty.com/tsumuji/2009/06/project-euler-7.html


# ピタゴラスの定理
def pythagoras(n)
  answer = []
  1.upto(n/3) do |a|

    # p n
    # p a
    # n**2/ 2n - 2a した結果を
    div,mod = (n**2).divmod(2 * n - 2 * a)

    if mod.zero?
      b = n - div
      break if a > b
      answer.push([a,b,n-a-b])
    end
  end
  answer
end

max_length = 0
num = 0
(1..1000).each do |n|
  if max_length < pythagoras(n).length
    max_length = pythagoras(n).length
    num = n
  end
end

p max_length
p num