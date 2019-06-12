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
  num1 = rand 10
  num2 = rand 10
  question = generate_question operator, num1, num2
  answer = get_answer operator, num1, num2
  obj = {question: question, answer: answer}
end