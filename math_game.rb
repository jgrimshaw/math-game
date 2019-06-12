#  PLAYER
# - keep track of number of lives
# - remove lives
# - player name



# GAME
# ============================
class Game
  attr_reader :p1, :p2, :turn
  def initialize p1, p2
    @p1 = p1
    @p2 = p2
    @turn = p1
  end

  def start
    while p1.lives > 0 && p2.lives > 0
      puts "#{p1.name} #{p1.lives}/3 | #{p2.name} #{p2.lives}/3"
      puts "---------------------------"
      question = get_question
      puts "#{self.turn.name}: #{question[:question]}?"
      guess = gets.chomp.to_i
      if guess == question[:answer]
        puts "Correct answer!"
      else
        puts "Wrong answer!"
        self.turn.removeLife
      end
      puts "---------------------------"
      change_turn
    end
    puts "\nGAME OVER"
  end

  def change_turn
    @turn = @turn == p1 ? p2 : p1
  end
end





# game1 = Game.new player1, player2

# game1.start
