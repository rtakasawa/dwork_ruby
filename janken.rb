require 'byebug'
class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください。"
    puts "0: グー\n1: チョキ\n2: パー"
    player_hand = gets.chomp
  end
end
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hand = rand(0..2)
  end
end
class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    unless player_hand == "0" || player_hand == "1" || player_hand == "2"
      puts "0〜2の数字を入力してください。"
      return true
    else
      player_hand.to_i
    end
    janken_key = ["グー", "チョキ", "パー"]
    result = (player_hand.to_i - enemy_hand + 3) % 3
      if result == 2
        puts "相手の手は#{janken_key[enemy_hand]}です。あなたの勝ちです。"
        #繰り返しが終わらない
        #return falseいれてもだめ。breakもだめ。
        return false
      elsif result == 1
        puts "相手の手は#{janken_key[enemy_hand]}です。あなたの負けです。"
        return false
      else
        puts "相手の手は#{janken_key[enemy_hand]}です。あいこです。"
        return true
      end
  end
end
#それぞれのインスタンスを生成
player = Player.new
enemy = Enemy.new
janken = Janken.new
# 下記の記述で、ジャンケンメソッドが起動される
while true == janken.pon(player.hand, enemy.hand)
end
