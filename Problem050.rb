# 素数41は6つの連続する素数の和として表せる:
# 41 = 2 + 3 + 5 + 7 + 11 + 13.
# 100未満の素数を連続する素数の和で表したときにこれが最長になる.
# 同様に, 連続する素数の和で1000未満の素数を表したときに最長になるのは953で21項を持つ.
# 100万未満の素数を連続する素数の和で表したときに最長になるのはどの素数か?

require 'Prime'
prime_array = []


(1..100).each do |i|
  prime_array.push(i) if Prime.prime?(i)
end


sum = 0

(1..prime_array.size).each do |n|
  prime_array[n..-1].each do |i|
    p "#{n} #{i} #{sum + i}"
    # if (sum + i) <= 100 && 
    if Prime.prime?(sum+i)
      sum += i
      p sum
    end
  end
end

p sum

# 別の人の回答

# def prime?(n)
#   return false if n <= 1
#   return true if n == 2
#   return false if n != 2 && n % 2 == 0
 
#   limit = Math.sqrt(n).ceil
#   3.step(limit, 2) do |i|
#     return false if n % i == 0
#   end

#   return true
# end

# def hash_fac(sum, chain, min, max)
#   ret = Hash.new
#   ret["sum"] = sum
#   ret["chain"] = chain
#   ret["min"] = min
#   ret["max"] = max
#   return ret
# end

# def prime_chain(n)
#   hash_arr = Array.new
#   hash_arr.push(hash_fac(2,1,2,2))
#   return hash_arr[0] if n < 5
  
#   i = 3
#   prime_chain = hash_fac(0,0,0,0)
#   loop do
#     if prime?(i)
#       dup = hash_arr.dup
#       dup.each_with_index do |h|
#         next if h["sum"]+i > n
#         next_hash = hash_fac(h["sum"]+i, h["chain"]+1, h["min"], i)
#         if next_hash["chain"] > prime_chain["chain"] && prime?(next_hash["sum"])
#           prime_chain = next_hash
#         end
#         hash_arr.push(next_hash)
#       end
#       hash_arr.push(hash_fac(i, 1, i, i))
#       hash_arr = hash_arr.select{ |h| h["max"] == i }
#     end
#     i = i + 2
#     break if i > n
#   end
#   return prime_chain
# end
# chain = prime_chain(1000000)
# puts chain.to_s