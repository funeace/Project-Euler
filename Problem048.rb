# 次の式は, 11 + 22 + 33 + ... + 1010 = 10405071317 である.
# では, 11 + 22 + 33 + ... + 10001000 の最後の10桁を求めよ.

def double(n)
  return n ** n
end

p (1..1000).inject{|sum,item| sum += double(item)}.to_s[-10,10].to_i