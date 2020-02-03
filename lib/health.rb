module FightingGame

  class Health

    def initialize(player1)
      @player = player1
    end

    def draw
      if @player.health >= 100
        # image = Gosu::Image.new('assets/unnamed.png')
      end
    end

  end

end
