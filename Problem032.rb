# すべての桁に 1 から n が一度だけ使われている数をn桁の数がパンデジタル (pandigital) であるということにしよう: 例えば5桁の数 15234 は1から5のパンデジタルである.
# 7254 は面白い性質を持っている. 39 × 186 = 7254 と書け, 掛けられる数, 掛ける数, 積が1から9のパンデジタルとなる.
# 掛けられる数/掛ける数/積が1から9のパンデジタルとなるような積の総和を求めよ.
# HINT: いくつかの積は, 1通り以上の掛けられる数/掛ける数/積の組み合わせを持つが1回だけ数え上げよ.



# 考え方
# x + y + sumをto_sした結果が9桁 かつ、1から9まで含まれている

def pandegital?(result)
  num_chk = (1..9).to_a
  result_chk = result.split("").map(&:to_i).sort

  num_chk == result_chk ? true : false
end

# p pandegital?(1,2,3)

answer = []

(1..100000).each do |x|
  (1..100000).each do |y|
    result = x.to_s + y.to_s + (x * y).to_s
    if result.size == 9 && pandegital?(result)
      p result

      answer.push(x * y)
      break
    elsif result.size >= 10
      break
    end
  end
end

p answer.uniq.sum