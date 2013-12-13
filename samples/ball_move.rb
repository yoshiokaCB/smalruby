require "smalruby"
Window.width = 690

# ボールの移動スピード
ball_speed = 5

# ボールの跳ねる力
ball_power = 20

# 重力の力
gravity_power = 1

# バウンドの位置
land = 310

# 壁の位置
wall = 510

# 境界線
canvas = Canvas.new
canvas.on(:start) do
  box_fill(left: 0, top: land+10, right: 690, bottom: 480, color: "yellowgreen")
  box_fill(left: wall+20 , top: 50, right: wall+30, bottom: land+20, color: "burlywood")
end

#ボール設置用のキャンバス準備
ball = Canvas.new(x: 0, y: land, width: 22, height: 22)
ball.on(:start) do

  #キャンバスにボールを表示
  circle_fill(x: 10, y: 10, r: 10, color: "white")

  # y軸移動の初期値
  posi_y = ball_power

  # ボールの動き
  loop do

    #　x軸の移動
    move ball_speed
    self.x >= wall ? turn : turn_if_reach_wall

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
