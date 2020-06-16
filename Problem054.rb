# カードゲームのポーカーでは, 手札は5枚のカードからなりランク付けされている. 役を低い方から高い方へ順に並べると以下である.

# 役無し(ハイカード): 一番値が大きいカード
# ワン・ペア: 同じ値のカードが2枚
# ツー・ペア: 2つの異なる値のペア
# スリーカード: 同じ値のカードが3枚
# ストレート: 5枚の連続する値のカード
# フラッシュ: 全てのカードが同じスート (注: スートとはダイヤ・ハート・クラブ/スペードというカードの絵柄のこと)
# フルハウス: スリーカードとペア
# フォーカード: 同じ値のカードが4枚
# ストレートフラッシュ: ストレートかつフラッシュ
# ロイヤルフラッシュ: 同じスートの10, J, Q, K, A
# ここでカードの値は小さい方から2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, Aである. (訳注：データ中で10は'T'と表される)


@word_mapping = {"A" => 1,"2" => 2,"3" => 3,"4" => 4,"5" => 5,"6" => 6,"7" => 7,"8" => 8,
                "9" => 9,"T" => 10,"J" => 11,"Q" => 12,"K" => 13}

@count = 0

def role(words)
  gara = []
  num = []

  word_array = words.map do |w|
      [@word_mapping[w[0]],w[1]]
    end

  word = word_array.each_slice(5).to_a

  word.each do |w|
    # w[0]とw[1]を分割する
    w.each do |x|
      num.push(x[0])
      gara.push(x[1])
    end
  end
  num_hands = num.each_slice(5).to_a
  gara_hands = gara.each_slice(5).to_a

  # 2.times do |i|
  #   gara_hands.
  # end

end


def yaku(word)


end

# 1行ずつ取得
read_file = File.open("TEXT/Problem054.txt", "r"){ |f| f.read.split(" ") }

# 1行ずつのAとBを分割
line = read_file.each_slice(10).to_a

line.each do |i|
  p i
  role(i)
end