require "smalruby"
Window.width = 690

# 境界線
canvas = Canvas.new
canvas.on(:start) do
  box_fill(left: 0, top: 320, right: 690, bottom: 480, color: "yellowgreen")
  box_fill(left: 540, top: 50, right: 550, bottom: 330, color: "burlywood")
end

#ボール設置用のキャンバス準備
ball = Canvas.new(x: 0, y: 310, width: 30, height: 30)
ball.on(:start) do

  #キャンバスにボールを表示
  circle_fill(x: 10, y: 10, r: 10, color: "white")

  # y軸移動の初期値　この値を大きくすると大きく跳ねる
  posi_y = 20

  # ボールの動き
  loop do

    #　x軸の移動
    move 5
    self.x >= 510 ? turn : turn_if_reach_wall

    #　y軸の移動
    self.y -= posi_y

    # ボールの跳ねる動き　（下まで行ったら初期値に戻す）
    posi_y += self.y >= 310 ? 20 : -2

  end

end

ball.on(:click) do
  turn
end
