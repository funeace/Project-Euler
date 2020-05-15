# 次の情報が与えられている.

# 1900年1月1日は月曜日である.
# 9月, 4月, 6月, 11月は30日まであり, 2月を除く他の月は31日まである.
# 2月は28日まであるが, うるう年のときは29日である.
# うるう年は西暦が4で割り切れる年に起こる. しかし, 西暦が400で割り切れず100で割り切れる年はうるう年でない.
# 20世紀（1901年1月1日から2000年12月31日）中に月の初めが日曜日になるのは何回あるか?
# # 西暦をy、月をm、日をdとしたとき
# # 

count = 0

# dateだしてwdayでもいけそう
require 'Date'

(1901..2000).each do |year|
  (1..12).each do |month|
    count += 1 if Date.new(year,month,1).wday == 0
  end
end

p count


# メソッドがうまくいっていないiii
# zellerの公式より
# 曜日＝(y＋y／4－y／100＋y／400＋(13×m＋8)／5＋d)mod7
# def zeller(y,m,d)
#   zeller_r,zeller_y = y.divmod(100)
#   return (d + (26*(m+1)/10) + zeller_y + (zeller_y/4) + zeller_r) % 7
# end

# 問題を間違えたw
# # 月の最大日を求める
# def month_date(y,m)
#   nisimuku_samurai = [2,4,6,9,11]

#   if ((y % 4 == 0 && y % 100 != 0) || (y % 100 == 0 && y % 400 == 0 )) &&  m == 2
#     return 29
#   elsif m == 2
#     return 28
#   elsif nisimuku_samurai.include?(m)
#     return 30
#   else
#     return 31
#   end
# end

# # if year % 4 == 0

# (1901..2000).each do |year|
#   (1..12).each do |month|
#     # p "#{year}/#{month}"

#     if zeller(year,month,1) == 0
#      p "#{year}/#{month}"
#       count = count + 1 
#     end
#   end
# end

# p count
