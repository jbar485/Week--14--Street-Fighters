# require 'concurrent'
module FightingGame
  class Game < Gosu::Window
    def initialize
      super(800, 600, false)
      self.caption = 'Figther'
      @start =  Gosu::Sample.new("assets/sound/start.wav")
      @start.play
      @music = Gosu::Song.new("assets/music/#{["fight2", "fight1", "fight_theme"].sample}.mp3")
      @music.volume = 0.4
      @backdrop = Backdrop.new(self, "/Cover.png")
      @player1 = Player.new(self,"crimsaur", false)
      @player2 = Player.new(self, "poolio", true)
      @controls1 = Controls.new(self, @player1, @player2, 1)
      @controls2 = Controls.new(self, @player2, @player1, 2)
      @overlay = Overlay.new self, @player1, @player2
    end


    def draw
      # @startpage.draw
      @backdrop.draw
      if Gosu.milliseconds >= 3500
        @player1.draw
        @player2.draw
        @overlay.draw
        @backdrop  = Backdrop.new(self, "battlebrawl_backdrop.png")
        @music.play
      end
    end

    def update
      @controls1.update 0, @player2.left
      @controls2.update @player1.right, width
      @overlay.update
    end

    def button_down(id)
      @controls1.button_down button_id_to_char(id)
      @controls2.button_down button_id_to_char(id)
    end

    def button_up(id)
      @controls1.button_up button_id_to_char(id)
      @controls2.button_up button_id_to_char(id)
    end

    def button_down?(char)
      super char_to_button_id(char)
    end
  end

end
