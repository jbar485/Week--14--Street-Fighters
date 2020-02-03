module FightingGame

  class Game < Gosu::Window
    def initialize
      super(800, 600, false)
      self.caption = 'Figther'
      @backdrop  = Backdrop.new(self, "battlebrawl_backdrop.png")

      @player1 = Player.new(self,"ryu", false)
      @player2 = Player.new(self, "ken", true)

      @controls1 = Controls.new(self, @player1, 1)
      @controls2 = Controls.new(self, @player2, 2)
    end


    def draw
      @backdrop.draw
      @player1.move_to 100
      @player2.move_to width - 100 - @player2.width
      @player1.draw
      @player2.draw
    end

    def update
    @controls1.update 0, @player2.left
    @controls2.update @player1.right, width
    end

    def button_down?(char)
      super char_to_button_id(char)
    end

  end
end
