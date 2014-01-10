require "smalruby"
# 画面サイズ
width = 800

# ボールの移動スピード
ball_speed = 10

# ボールの跳ねる力
ball_power = 30

# 重力の力
gravity_power = 2

# バウンドの位置
land = 310

Window.width = 800

# 背景
canvas = Canvas.new
canvas.on(:start) do
  box_fill(left: 0, top: land+10, right: width, bottom: 480, color: "yellowgreen")
end

# 壁
wall= Canvas.new(x: 780, y: 50, width: 10, height: 280)
wall.on(:start) do
  box_fill(left: 0 , top: 0, right: 10, bottom: 280, color: "burlywood")
end

# ラケット
racket= Canvas.new(x: 40, y: 200, height: 50, width: 10)
racket.on(:start) do
  box_fill(left: 0, top: 0, right: 10, bottom: 50, color: "yellowgreen")
end


#ボール
ball = Canvas.new(x: 10, y: land, width: 22, height: 22)
ball.on(:start) do
  #キャンバスにボールを表示
  circle_fill(x: 10, y: 10, r: 10, color: "white")

  # y軸移動の初期値
  posi_y = ball_power

  # ボールの動き
  loop do

    #　x軸の移動
    move ball_speed

    #　y軸の移動
    self.y -= posi_y

    # ボールの跳ねる動き　（下まで行ったら初期値に戻す）
    if self.y >= land
      posi_y = ball_power
      self.y = land
    else
      posi_y -= gravity_power
    end
  end
end

# ボールをクリックしたときの動き
ball.on(:click) { turn }

# ラケットの操作
racket.on(:key_down, K_UP){racket.y -= 3}
racket.on(:key_down, K_DOWN){racket.y += 3}
racket.on(:key_down, K_LEFT){racket.x -= 3}
racket.on(:key_down, K_RIGHT){racket.x += 3}

# ボールが壁にぶつかったときの動き
wall.on(:hit, ball) do
  ball.turn
end

# ボールとラケットが当たったときの動き
ball.on(:hit, racket) do                                          
  turn                                                          
  self.x += 5
end 


