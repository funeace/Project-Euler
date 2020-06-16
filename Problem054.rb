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


# @word_mapping = {"A" => 1,"2" => 2,"3" => 3,"4" => 4,"5" => 5,"6" => 6,"7" => 7,"8" => 8,
#                 "9" => 9,"T" => 10,"J" => 11,"Q" => 12,"K" => 13}

# @count = 0

# def role(words)
#   gara = []
#   num = []

#   word_array = words.map do |w|
#       [@word_mapping[w[0]],w[1]]
#     end

#   word = word_array.each_slice(5).to_a

#   word.each do |w|
#     # w[0]とw[1]を分割する
#     w.each do |x|
#       num.push(x[0])
#       gara.push(x[1])
#     end
#   end
#   # 個人の手を作る
#   num_hands = num.each_slice(5).to_a
#   gara_hands = gara.each_slice(5).to_a

#   # 文字列の長さを
#   2.times do |i|
#   p num = num_hands[i].group_by(&:itself).transform_values(&:size)
#   p gara = gara_hands[i].group_by(&:itself).transform_values(&:size)
#   end
# end


# def yaku(num,gara)

# end

# # 1行ずつ取得
# read_file = File.open("TEXT/Problem054.txt", "r"){ |f| f.read.split(" ") }

# # 1行ずつのAとBを分割
# line = read_file.each_slice(10).to_a

# line.each do |i|
#   p i
#   role(i)
# end





# 回答
@change_table = { 'T': 10, 'J': 11, 'Q': 12, 'K': 13, 'A': 14 }

# 手札の役と最大値を調べる

# 数字だけでできたソート済配列が同じ数字を2つ以上含む場合、
# 最初にでてきたものがいくつあるか数え、残りの配列とセットで返す
def get_how_many_same_nums(arr)
  arr.sort!
  ret = 0
  arr.each_cons(2).with_index do |a, i|
    if a[0] == a[1]
      ret += (ret > 0 ? 1 : 2)
    elsif ret > 0
      return { count: ret, left: arr-arr[0..i] }
    end
  end
  { count: ret, left: [] }
end

# 手札から数字だけ抽出した配列を返す
def get_nums_from_hand(hand)
  ret = []
  hand.each{ |card| ret.push(card[:number]) }
  ret
end

def flash?(hand)
  suit = hand[0][:suit]
  hand[1..-1].each{ |card| return false if suit != card[:suit]  }
  true
end

def straight?(nums)
  nums.each_cons(2) { |a, b| return false if b-a != 1 }
  true
end

def loyal_straight?(nums)
  nums[0] == 10 && straight?(nums)
end

# 渡された手札の役と、役を構成するカードの最高値を求める
def get_score_of_hand(hand)
  nums = get_nums_from_hand(hand)
  return { rank: 9, high: nums[4] } if loyal_straight?(nums) && flash?(hand) # loyal straight flash
  return { rank: 8, high: nums[4] } if straight?(nums) && flash?(hand) # straight flash

  hash_a = get_how_many_same_nums(get_nums_from_hand(hand))
  hash_b = get_how_many_same_nums(hash_a[:left])

  return { rank: 7, high: (nums-hash_a[:left]).max } if hash_a[:count] == 4 # four card
  return { rank: 6, high: nums[4] } if hash_a[:count]*hash_b[:count] == 6 # full house
  return { rank: 5, high: nums[4] } if flash?(hand) # flash
  return { rank: 4, high: nums[4] } if straight?(nums) # straight

  return { rank: 3, high: (nums-hash_a[:left]).max } if hash_a[:count] == 3 # three card
  return { rank: 2, high: (nums-hash_b[:left]).max } if hash_a[:count] == 2 && hash_b[:count] == 2 # two pairs
  return { rank: 1, high: (nums-hash_a[:left]).max } if hash_a[:count] == 2 # one pair
  { rank: 0, high: nums[4] } # pig
end

# アルファベットで表された数字を数字に変換する
def change_num(num)
  return @change_table[num.to_sym] if @change_table.keys.include?(num.to_sym)  
  return num.to_i if num.to_i >= 2 && num.to_i <= 9
  return nil
end

win_count = 0
File.open("poker.txt") do |f|
  f.each_line do |line|
    line.gsub!(/\n/, "")
    arr = line.split(' ')
    
    cards = []
    arr.each{ |card| cards.push({'number': change_num(card.slice(0,1)), 'suit': card.slice(1,1)}) }

    player_1 = get_score_of_hand(cards[0..4].sort_by{ |c| c[:number] })
    player_2 = get_score_of_hand(cards[5..9].sort_by{ |c| c[:number] })
    
    if player_1[:rank] > player_2[:rank]
      win_count += 1
    elsif (player_1[:rank] == player_2[:rank] && player_1[:high] > player_2[:high])
      win_count += 1
    end
  end
end

p win_count