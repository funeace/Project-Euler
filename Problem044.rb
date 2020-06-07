# 五角数は Pn = n(3n-1)/2 で生成される. 最初の10項は
# 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
# である
# P4 + P7 = 22 + 70 = 92 = P8 である. しかし差 70 - 22 = 48 は五角数ではない.
# 五角数のペア Pj と Pk について, 差と和が五角数になるものを考える.
# 差を D = |Pk - Pj| と書く. 差 D の最小値を求めよ

chk_penta = []
isBreak = false
# 
(1..1000000).each do |i|
  chk_penta.push(i * (3 * i - 1) / 2)
end

p chk_penta

(500000..10000000).each do |i|
  n = i * (3 * i - 1) / 2
  p n

  chk_penta.each do |j|
    if chk_penta.include?(n + j) && chk_penta.include?( (n - j) )
      puts "answer:#{(n-j).abs}"
      isBreak = true
      break
    elsif j >= n
        break 
    end
  end
  break if isBreak
end