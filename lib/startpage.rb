module FightingGame

  class Startpage < Gosu::Image

  def initialize(window, filename, status)
    super(window, "assets/#{filename}", false)
    @status = status
    @scale = window.height / height
    @bg_x  = -(width * @scale - window.width) / 2
  end




  def draw
    super @bg_x, 0, 0, @scale, @scale

  end

end

end
