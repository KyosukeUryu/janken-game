

class Player
  def hand
    while true do
      puts "0: グー"
      puts "1: チョキ"
      puts "2: パー"
      your_num = gets.chomp
      if your_num == "0" || your_num == "1" || your_num == "2"
        return your_num.to_i
        break
      else
        puts "0~2の数字を入力してください"
      end
    end
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
  end
end

class Enemy
  def hand
    enemy_num = rand(3)
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    hands = ["グー", "チョキ", "パー"]
    if player_hand != 0 && player_hand != 1 && player_hand != 2
      puts "0〜2の数字を入力してください"
      return true
    elsif (player_hand - enemy_hand + 3) % 3 == 1
      puts "相手の手は#{hands[enemy_hand]}です。あなたの負けです。"
      return false
    elsif (player_hand - enemy_hand + 3) % 3 == 2
      puts "相手の手は#{hands[enemy_hand]}です。あなたの勝ちです。"
      return false
    else
      puts "あいこです、もう一度0~2の数字を入力してください"
      return true
    end
  end
end

puts "数字を入力してください"

player = Player.new
enemy = Enemy.new
janken = Janken.new

game = true
#下記の記述で、ジャンケンメソッドが起動される
while game do
  game = janken.pon(player.hand, enemy.hand)
end
