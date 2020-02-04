module FightingGame

  class Player
    SCALE = 1   # same for all players
    SPEED = 9

    attr_accessor :health, :pos_x, :flip, :status

    def initialize(window, name, flip=false)
      @tiles = Tileset.new(window, name)
      @pos_y = 180
      @pos_x = 0
      @pos_y = 180
      @flip  = flip
      @max_x = window.width
      @health = 100
      @max_y  = window.height
      @status = 'idle'
      @max_y = window.height

      move_to flip ? @max_x - 100 - width : 100
      idle!
    end

    def punch_damage(player2)
      if self.flip == true
        if player2.pos_x >= (self.pos_x - 200)
          player2.health -= 10
          player2.pos_x -= 50 if player2.pos_x > 50
          player2.hit!
        end
      else
        if self.pos_x >= (player2.pos_x - 200)
          player2.health -= 10
          player2.pos_x += 50 if player2.pos_x < 650
          player2.hit!
        end
      end
    end

    def kick_damage(player2)
      if self.flip == true
        if player2.pos_x >= (self.pos_x - 200)
          player2.health -= 10
          player2.pos_x -= 150 if player2.pos_x > 50
          player2.hit!
        end
      else
        if self.pos_x >= (player2.pos_x - 200)
          player2.health -= 10
          player2.pos_x += 150 if player2.pos_x < 650
            player2.hit!

        end
      end
    end

    def idle!
        return if @busy
        @tiles.idle!
        @pos_y = 180
        @status = 'idle'
    end

    def walking!
      if @status == 'idle'
      @pos_y = 180
      @tiles.walking!
      @status = 'busy'
    end
    end

    def hit!
      @pos_y = 180
      @tiles.hit! do
        @busy = false
        idle!
      end
    end

    def crouch!
      if @status == 'idle'
        @tiles.crouch!
        @pos_y = 245
        @status = 'busy'
      end
    end

    def blocking!
      if @status == 'idle'
        @pos_y = 180
        @tiles.blocking!
        @status = 'busy'
      end
    end

    def punch!
      if @status == 'idle'
        @busy = true
        @pos_y = 180
        @tiles.punch! do
          @busy = false
          idle!
        end
        @status = 'busy'
      end
    end

    def kick!
      if @status == 'idle'
        @busy = true
        @pos_y = 180
        @tiles.kick! do
          @busy = false
          idle!
        end
        @status = 'busy'
      end
    end

    def move_to(x)
      @pos_x = x
    end

    def move_left
      @pos_x -= SPEED
    end

    def move_right
      @pos_x += SPEED
    end

    def left
      @pos_x
    end

    def right
      @pos_x + width
    end

    def width
      @tiles.width * SCALE
    end

    def draw
      pos_x   = @pos_x + (@flip ? width : 0)
      scale_x = SCALE * (@flip ? -1 : 1)

      @tiles.draw(pos_x, @pos_y, 1, scale_x, SCALE)
    end

    private

    class Tileset < Hash

      def initialize(window, name)
        self[:idle]     = FightingGame::Animation.new(window, "#{name}/idle")
        self[:walking]  = FightingGame::Animation.new(window, "#{name}/walking")
        self[:blocking] = FightingGame::Animation.new(window, "#{name}/blocking")
        self[:punch]    = FightingGame::Animation.new(window, "#{name}/punch")
        self[:kick]     = FightingGame::Animation.new(window, "#{name}/kick")
        self[:crouch]   = FightingGame::Animation.new(window, "#{name}/crouch")
        self[:hit]      = FightingGame::Animation.new(window, "#{name}/hit")
        idle!
      end

      def hit!(&callback)
        @current_animation = self[:hit]
        @current_animation.play_once &callback
      end

      def idle!
        @current_animation = self[:idle]
      end

      def walking!

        @current_animation = self[:walking]
      end

      def blocking!
        @current_animation = self[:blocking]
      end

      def crouch!
        @current_animation = self[:crouch]
      end

      def punch!(&callback)
        @current_animation = self[:punch]
        @current_animation.play_once &callback
      end

      def kick!(&callback)
        @current_animation = self[:kick]
        @current_animation.play_once &callback
      end

      def width
        @current_animation.width
      end

      def draw(*args)
        @current_animation.draw *args
      end

    end
  end

end
