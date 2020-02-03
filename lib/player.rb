module FightingGame

class Player
  SCALE = 5
  POS_Y = -150

  def initialize(window, name)
    @image = Gosu::Image.new(window, "assets/#{name}/idle-1.gif")
    # move_to 0
  end
def move_to(x)
  @pos_x = x
end

  def draw
    @image.draw( 100, POS_Y, 1, SCALE, SCALE)
  end
end


end
