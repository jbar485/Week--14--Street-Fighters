module FightingGame
  class Overlay

    def initialize(window, player1, player2)
      @player1 = player1
      @player2 = player2
      @window = window
      @healthbar1 = Healthbar.new player1, @window
      @healthbar2 = Healthbar.new player2, @window
      @specialbar2 = SpecialBar.new player2, @window
      @specialbar1 = SpecialBar.new player1, @window
      @time = Gosu::milliseconds
      @p1name = Gosu::Image.from_text(@window, "#{@player1.name.capitalize}", Gosu.default_font_name, 45)
      @p2name = Gosu::Image.from_text(@window, "#{@player2.name.capitalize}", Gosu.default_font_name, 45)
      @p1profile = Gosu::Image.new(@window, "assets/#{@player1.name}/profile.png")
      @p2profile = Gosu::Image.new(@window, "assets/#{@player2.name}/profile.png")
    end

    def update
      @p1name = Gosu::Image.from_text(@window, "#{@player1.name.capitalize}", Gosu.default_font_name, 45)
      @p2name = Gosu::Image.from_text(@window, "#{@player2.name.capitalize}", Gosu.default_font_name, 45)
      @p1profile = Gosu::Image.new(@window, "assets/#{@player1.name}/profile.png")
      @p2profile = Gosu::Image.new(@window, "assets/#{@player2.name}/profile.png")
    end

    def draw
      @specialbar1.draw
      @specialbar2.draw
      @healthbar1.draw
      @healthbar2.draw
      @p1name.draw(120, 50, 0)
      @p2name.draw(600, 50, 0)
      @p1profile.draw(0, 50, 0)
      @p2profile.draw(675, 50, 0)
      if @player1.health <= 0
        text = Gosu::Image.from_text(@window, "#{@player2.name.capitalize} Wins!", Gosu.default_font_name, 60)
        text.draw(280,75.5,0)
      elsif @player2.health <= 0
        text = Gosu::Image.from_text(@window, "#{@player1.name.capitalize} Wins!", Gosu.default_font_name, 60)
        text.draw(280,75.5,0)
      end
    end
  end

  private
  class Healthbar
    def initialize player, window
      @player = player
      @window = window
    end

    def draw
      width = @player.health * 3
      return if width <= 0
      x = @player.flip == false ? 20 : @window.width - width - 20
      y = 20
      color = Gosu::Color::YELLOW
      @window.draw_quad(x-5, y-5, Gosu::Color::BLACK, x+5+width, y-5, Gosu::Color::BLACK, x+5+width, 2*y+5, Gosu::Color::BLACK, x-5, 2*y+5, Gosu::Color::BLACK, 1)
      @window.draw_quad(x, y, color, x + width, y, color, x+width, 2*y, color, x, 2*y, color, 1)


    end
  end

  class SpecialBar
    def initialize player, window
      @player = player
      @window = window
    end
    def draw
      width = @player.ex_meter * 3
      return if width <= 0
      x = @player.flip == false ? 20: @window.width - width - 20
      y = 20
      if @player.ex_meter == 50
        color = Gosu::Color::CYAN
      @window.draw_quad(x-5, y+547, Gosu::Color::BLACK, x+5+width, y+547, Gosu::Color::BLACK, x+5+width, 2*y+560, Gosu::Color::BLACK, x-5, 2*y+560, Gosu::Color::BLACK, 1)
      @window.draw_quad(x, y+550, color, x + width, y+550, color, x+width, 3*y+537, color, x, 3*y+537, color, 1)
    else
      color = Gosu::Color::GREEN
      @window.draw_quad(x-5, y+547, Gosu::Color::BLACK, x+5+width, y+547, Gosu::Color::BLACK, x+5+width, 2*y+560, Gosu::Color::BLACK, x-5, 2*y+560, Gosu::Color::BLACK, 1)
      @window.draw_quad(x, y+550, color, x + width, y+550, color, x+width, 3*y+537, color, x, 3*y+537, color, 1)
    end



    end
  end
end
