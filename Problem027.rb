# オイラーは以下の二次式を考案している:
# n2 + n + 41.
# この式は, n を0から39までの連続する整数としたときに40個の素数を生成する.
# しかし, n = 40 のとき 402 + 40 + 41 = 40(40 + 1) + 41 となり41で割り切れる.
# また, n = 41 のときは 412 + 41 + 41 であり明らかに41で割り切れる.
# 計算機を用いて, 二次式 n2 - 79n + 1601 という式が発見できた.
# これは n = 0 から 79 の連続する整数で80個の素数を生成する. 係数の積は, -79 × 1601 で -126479である.
# さて, |a| < 1000, |b| ≤ 1000 として以下の二次式を考える (ここで |a| は絶対値): 例えば |11| = 11 |-4| = 4である.
# n2 + an + b
# n = 0 から始めて連続する整数で素数を生成したときに最長の長さとなる上の二次式の, 係数 a, b の積を答えよ.
# 理解が足りない

# オイラーの法則
def oiler(a,b,n)
  n ** 2 + a * n + b
end

# 素数判定
def prime?(n)
  return true if n == 2 
 
  limit = Math.sqrt(n).ceil
  3.step(limit, 2) do |i|
    return false if n % i == 0
  end

  return true
end

# ユークリッドの互除法
def euclidean(a, b)
  if a > b && b != 0
    euclidean(a%b, b)
  elsif a < b && a != 0
    euclidean(a, b%a)
  else
    return (a > b ? a : b)
  end
end

# 連続する素数の判定して、素数の数を数える
def check_prime(a,b,ans)
  max_n = ans[0]
  answer = ans[1]

  1.step do |n|
    f = oiler(a,b,n)
    break if f < 2
    
    unless prime?(f)
      if max_n < n
        puts "n = " + n.to_s + ", a = " + a.to_s + ", b = " + b.to_s
        max_n = n
        answer = a*b
      end
      break
    end
  end
  
  return [max_n, answer]
end

# 探索開始
ans = [0, 0]

# n = 0を考えるとbは素数
# b = 2, n = 1のときfunc = a + 3
# これが素数になりうるのはaが偶数のときのみ
# a = even, b = 2
2.step(1000, 2) do |a|
  ans = check_prime(a, 2, ans)
  ans = check_prime(-a, 2, ans)

end


# bを求める
1.step(1000, 2) do |a|
  ans = check_prime(a, 2, ans)
  ans = check_prime(-a, 2, ans)

  
  3.step(1000, 2) do |b|
    next if euclidean(a, b) != 1
    next unless prime?(b)

    # a:+, b:+
    ans = check_prime(a, b, ans)
    ans = check_prime(-a, b, ans)
  end
end

puts ans




# さんこうにしt答え
# coding: utf-8
# Problem 27

# 関数の値を返す
# def func(a,b,n)
#   a = a.to_i
#   b = b.to_i
#   n = n.to_i
#   return n*n + a*n + b
# end

# # 引数が素数かどうか調べる
# def check_if_prime(n)
#   return true if n == 2 
 
#   limit = Math.sqrt(n).ceil
#   3.step(limit, 2) do |i|
#     return false if n % i == 0
#   end

#   return true
# end

# # ユークリッドの互除法で最大公約数を求める
# def euclidean(a, b)
#   if a > b && b != 0
#     euclidean(a%b, b)
#   elsif a < b && a != 0
#     euclidean(a, b%a)
#   else
#     return (a > b ? a : b)
#   end
# end

# # funcをn=0から順に呼び出して連続していくつ素数になるか調べる
# def prime_chain(a, b, ans)
#   max_n = ans[0]
#   answer = ans[1]

#   1.step do |n|
#     f = func(a,b,n)
#     break if f < 2
    
#     if !check_if_prime(f)
#       if max_n < n
#         puts "n = " + n.to_s + ", a = " + a.to_s + ", b = " + b.to_s
#         max_n = n
#         answer = a*b
#       end
#       break
#     end
#   end
  
#   return [max_n, answer]
# end

# # 探索開始
# ans = [0, 0]

# # n = 0を考えるとbは素数

# # b = 2, n = 1のときfunc = a + 3
# # これが素数になりうるのはaが偶数のときのみ
# # a = even, b = 2
# 2.step(1000, 2) do |a|
#   # a:+, b:+
#   ans = prime_chain(a, 2, ans)

#   # a:-, b:+
#   ans = prime_chain(-a, 2, ans)
# end

# # b>2ならばbは奇数
# # n = 1のときfunc = a+b+1,b+1は偶数なのでaは奇数
# # a = odd, b = prime(>2)
# 1.step(1000, 2) do |a|

#   # b = 2
#   # a:+, b:+
#   ans = prime_chain(a, 2, ans)

#   # a:-, b:+
#   ans = prime_chain(-a, 2, ans)

  
#   3.step(1000, 2) do |b|
#     next if euclidean(a, b) != 1
#     next if !check_if_prime(b)

#     # a:+, b:+
#     ans = prime_chain(a, b, ans)

#     # a:-, b:+
#     ans = prime_chain(-a, b, ans)

#     # b<0のときfunc(n=0)が負なので調べなくて良い
    
#   end
# end

# puts ans.to_s