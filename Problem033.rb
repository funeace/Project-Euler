# 49/98は面白い分数である.「分子と分母からそれぞれ9を取り除くと, 49/98 = 4/8 となり,
# 簡単な形にすることができる」と経験の浅い数学者が誤って思い込んでしまうかもしれないからである.
# (方法は正しくないが，49/98の場合にはたまたま正しい約分になってしまう．)
# 我々は 30/50 = 3/5 のようなタイプは自明な例だとする.
# このような分数のうち, 1より小さく分子・分母がともに2桁の数になるような自明でないものは, 4個ある.
# その4個の分数の積が約分された形で与えられたとき, 分母の値を答えよ.
# プロジェクトオイラー　３３問目
# http://odz.sakura.ne.jp/projecteuler/index.php?Problem%2033

# 条件1. 10の倍数以外の２桁の数を対象とする。
# 条件2. ax == bx (or ax == xb or xa == bx or xa == xb )となるような数で、ax/bx = a/bとなる数を考える。
# 条件3. a/b<1に限る。
# 条件4. 上記を満たす数は４つある。この４つの積の既約分数の分母を求めよ。

# denominator 分母
# molecure 分子

def elimination?(molecule, denominator)
  # 自明な例はfalse
  m_div,m_mod = molecule.divmod(10)
  n_div,n_mod = denominator.divmod(10) 

  return false if m_mod != n_div || n_mod.zero?
  return molecule/denominator == m_div/n_div
end

answer = []

(10..98).each do |x|
  (x + 1..99).each do |y|
    p x/y
    if elimination?(x,y)
      answer.push(x.div(y))
    end
  end
end

# p answer
p answer.sum

# 他の人の回答

# ユークリッドの互除法で最大公約数を求める
def euclidean(a, b)
  if a > b && b != 0
    euclidean(a%b, b)
  elsif a < b && a != 0
    euclidean(a, b%a)
  else
    return (a > b ? a : b)
  end
end

answer_num = 1
answer_den = 1
10.step(99) do |a|
  (a+1).step(99) do |b|
    next if a%10 == 0 && b%10 == 0

    flg = false
    common = ''
    a.to_s.each_char do |c|
      if b.to_s.include?(c)
        common = c
        flg = true
      end
    end
    next if !flg

    max_div = euclidean(a, b)
    next if max_div == 1

    removed_a = a.to_s.delete(common).to_i
    removed_b = b.to_s.delete(common).to_i
    max_div_removed = euclidean(removed_a, removed_b)
    next if removed_b == 0

    if a/max_div == removed_a/max_div_removed && b/max_div == removed_b/max_div_removed
      puts "#{a} / #{b},  #{a/max_div} / #{b/max_div}"
      answer_num = answer_num * a
      answer_den = answer_den * b
    end
    
  end
end

puts (answer_den/euclidean(answer_num, answer_den)).to_s