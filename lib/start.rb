require_relative "./fighting-game"

begin
  FightingGame::Game.new.show
rescue Interrupt => e
  puts "\rScratch by bellah!"
end
