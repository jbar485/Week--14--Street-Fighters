
module FightingGame

  class Controls
    PLAYER1 = {
      'a' => :left,
      'd' => :right,
      'q' => :block,
      'e' => :punch,
      'r' => :kick,
      's' => :crouch,
      'z' => :special,
      '1' => :character1,
      '2' => :character2,

    }

    PLAYER2 = {
      'j' => :left,
      'l' => :right,
      'u' => :block,
      'o' => :punch,
      'p' => :kick,
      'k' => :crouch,
      '.' => :special,
      '7' => :character4,
      '8' => :character5,
    }

    def initialize(window, player, player2, num)
      @window = window
      @player = player
      @player2 = player2
      @keys   = [PLAYER1, PLAYER2][num-1]
    end

    def update(left, right)
      case matching_action
      when :left  then @player.move_left  if @player.left > left
      when :right then @player.move_right if @player.right < right
      when :block then @player.blocking!
      when :punch then @player.punch!
      when :kick  then @player.kick!
      when :crouch  then @player.crouch!
      when :character1 then @player.character1!
      when :character2 then @player.character2!
      when :character3 then @player.character3!
      when :character4 then @player.character4!
      when :character5 then @player.character5!
      when :character6 then @player.character6!
      when :character7 then @player.character7!
      end
    end

    def button_down(key)
      case @keys[key]
      when :left, :right then @player.walking!
      when :block then @player.blocking!
      when :punch then @player.punch! && @player.punch_damage(@player2)
      when :special then @player.special! && @player.special_damage(@player2)
      when :kick  then @player.kick! && @player.kick_damage(@player2)
      end
    end

    def button_up(key)
      if @player.health >= 1
      @player.idle!
    end
    end

  private

    def matching_action
      @keys.each do |key, action|
        if @window.button_down? key
          return action
        end
      end
    end

  end

end
