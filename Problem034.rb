# # 145は面白い数である. 1! + 4! + 5! = 1 + 24 + 120 = 145となる.
# # 各桁の数の階乗の和が自分自身と一致するような数の和を求めよ.
# # 注: 1! = 1 と 2! = 2 は総和に含めてはならない.
# 8桁以降は必ず各桁の階乗の合計が小さくなります。
# よって9!×7までを調べれば網羅できそう


@total_array = []

def check_num(num)
  total = 0
  num_split = num.to_s.split("").map(&:to_i)
  num_split.each do |nums|
    total += (1..nums).inject(1) {|result,item| result * item }
  end

  @total_array.push(total) if num == total
end


(3..2540160).each do |x|
  check_num(x)
end
p @total_array
p @total_array.sum