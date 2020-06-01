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

# 回答あわない

def elimination?(molecule, denominator)
  # 自明な例はfalse
  m_div,m_mod = molecule.divmod(10)
  n_div,n_mod = denominator.divmod(10) 

  return false if m_mod != n_div || n_mod.zero?
  return molecule/denominator == m_div/n_div
end

answer = []

(10..99).each do |x|
  (10..99).each do |y|
    if elimination?(x,y)
      answer.push(x/y)
    end
  end
end

p answer.sum