# Problem056.rbGoogol (10100)は非常に大きな数である: 1の後に0が100個続く. 
# 100100は想像を絶する. 1の後に0が200回続く. その大きさにも関わらず, 両者とも数字和 ( 桁の和 ) は1である.
# a, b < 100 について自然数 ab を考える. 数字和の最大値を答えよ.

def sum_numbers(num)
  # 1桁ずつ分割
  num.to_s.split("").map(&:to_i).inject{|sum,item| sum += item}
end

answer = 0

  (1..100).each do |a|
    (1..100).each do |b|
      if answer < sum_numbers(a ** b)
        answer = sum_numbers(a ** b)
      end
    end
  end
  
p answer