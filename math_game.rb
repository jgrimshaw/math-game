#  PLAYER
# - keep track of number of lives
# - remove lives
# - player name

# PLAYER
# ==========================
class Player
  attr_reader :lives, :name

  def initialize name
    @name = name
    @lives = 3
  end

  def removeLife
    @lives -= 1
  end
end

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

# QUESTION
# ==============================
def get_question
  def generate_question operator, num1, num2
    "What is #{num1} #{operator} #{num2} ?"
  end
  def get_answer operator, num1, num2
    case operator
    when '+'
      return num1 + num2
    when '-'
      return num1 - num2
    when 'x'
      return num1 * num2
    when '/'
      return num1.to_f / num2
    else
      puts 'error'
    end
  end
  def get_operator
    num = rand 4
    case num
    when 0
      return '+'
    when 1
      return '-'
    when 2
      return 'x'
    when 3
      return '/'
    else
      puts 'error'
    end
  end
  operator = get_operator
  num1 = rand 21
  num2 = rand 21
  question = generate_question operator, num1, num2
  answer = get_answer operator, num1, num2
  obj = {question: question, answer: answer}
end

player1 = Player.new "Jack"
player2 = Player.new "James"

game1 = Game.new player1, player2

game1.start
