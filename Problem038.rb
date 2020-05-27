# 192 に 1, 2, 3 を掛けてみよう.
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# 積を連結することで1から9の パンデジタル数 192384576 が得られる.
# 192384576 を 192 と (1,2,3) の連結積と呼ぶ.
# 同じようにして, 9 を 1,2,3,4,5 と掛け連結することで
# パンデジタル数 918273645 が得られる. これは 9 と (1,2,3,4,5) との連結積である.
# 整数と (1,2,...,n) (n > 1) との連結積として得られる
# 9桁のパンデジタル数の中で最大のものはいくつか?
# 整数が5桁の場合は9桁のパンデジタル数を得られないため最大でも４桁
# i * j > 100000000

# 条件
# 1-9までの9桁
# 整数は4桁(9999まで)
# それぞれの計算結果を文字列として足し合わせていく

def pandigital?(result)
  search_key = (1..9).to_a
  check_arr = result.split("").map(&:to_i).sort

  search_key == check_arr ? true : false
end

answer = []

(1..10000).each do |i|
  result = ""
  (1..10000).each do |j|
    result += (i * j).to_s
    # sizeが9桁より大きかったらbreak、
    if result.size == 9 && pandigital?(result)
      answer.push(result)
      break
    elsif result.size >= 10
      break
    end
  end
end

p answer.max.to_i