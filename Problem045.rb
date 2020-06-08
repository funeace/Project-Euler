# 三角数, 五角数, 六角数は以下のように生成される.

# 三角数 Tn=n(n+1)/2 1, 3, 6, 10, 15, ...
# 五角数 Pn=n(3n-1)/2  1, 5, 12, 22, 35, ...
# 六角数 Hn=n(2n-1)  1, 6, 15, 28, 45, ...
# T285 = P165 = H143 = 40755であることが分かる.

# 次の三角数かつ五角数かつ六角数な数を求めよ.

# 以下だと遅すぎる
# triangle = []
# pentagon = []
# hexagon =  []

# (1..100000000).each do |n|
#   triangle.push((n + 1)/2)
#   pentagon.push(n * (3 * n - 1) / 2)
#   hexagon.push(n * (2 * n - 1))
# end

# p triangle & pentagon & hexagon

# 六角数であれば三角数である
# なので、六角数で五角数の物を探せばいい

hexagon = []
pentagon = []


(1..15000000).each do |n|
  pentagon.push(n * (3 * n - 1) / 2)
  hexagon.push(n * (2 * n - 1))
end

p hexagon & pentagon