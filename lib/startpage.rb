module Startpage

  class Startpage < Gosu::Window

  def initialize()
    super(800, 600, false)
    @image = Gosu::Image.new(self, "assets/Cover.png")
    @start =  Gosu::Sample.new("assets/sound/start.wav")
    @start.play
  end




  def draw
    @image.draw(0,0,0)
  end

end

end
