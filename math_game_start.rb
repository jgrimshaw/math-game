require "./math_question.rb"
require "./math_game.rb"
require "./math_player.rb"

player1 = Player.new "Jack"
player2 = Player.new "James"

game1 = Game.new player1, player2
game1.start
