# 125874を2倍すると251748となる. これは元の数125874と順番は違うが同じ数を含む.
# 2x, 3x, 4x, 5x, 6x が x と同じ数を含むような最小の正整数 x を求めよ.


def replacement_multiple(num)
  (1..6).map do |i|
    (num * i).to_s.split("").sort.map(&:to_i).join
  end.uniq.length == 1
end


# p replacement_multiple(142857)
p (1..200000).select{|i| replacement_multiple(i) }[0]