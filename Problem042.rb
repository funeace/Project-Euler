# 三角数のn項は tn = ½n(n+1)で与えられる. 最初の10項は
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# である.
# 単語中のアルファベットを数値に変換した後に和をとる. この和を「単語の値」と呼ぶことにする. 
# 例えば SKY は 19 + 11 + 25 = 55 = t10である. 単語の値が三角数であるとき, その単語を三角語と呼ぶ.
# 16Kのテキストファイル words.txt 中に約2000語の英単語が記されている. 三角語はいくつあるか?

def alpha_sum(word)
  word_mapping = {"A" => 1,"B" => 2,"C" => 3,"D" => 4,"E" => 5,"F" => 6,"G" => 7,"H" => 8,"I" => 9,"J" => 10,
                "K" => 11,"L" => 12,"M" => 13,"N" => 14,"O" => 15,"P" => 16,"Q" => 17,"R" => 18,"S" => 19,"T" => 20,
                "U" => 21,"V" => 22,"W" => 23,"X" => 24,"Y" => 25,"Z" =>26}
  sum = 0
  0.upto(word.size - 1) do |i|
    sum += word_mapping[word[i]]
  end
  sum
end

read_file = File.open("TEXT/problem042.txt", "r"){ |f| f.read.gsub('"','').split(",") }.sort!

# 三角数(50文字以上の単語数はないと想定)
triangle_array = (1..50).map{|n|  n * (n + 1)/2  }


p read_file.select{|r| triangle_array.include?(alpha_sum(r)) }.size
