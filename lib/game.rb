module FightingGame

  class Game < Gosu::Window
    def initialize
      super(800, 600, false)
      self.caption = 'Figther'
      @backdrop  = Backdrop.new(self, "battlebrawl_backdrop.png")

      @player1 = Player.new(self,"character1")
    end

    def update
    end

    def draw
      @backdrop.draw
      @player1.draw
    end

  end
end
