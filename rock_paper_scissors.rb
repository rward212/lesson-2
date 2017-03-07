def test_method
  prompt("Hello")
end

user = []
comp = [] 


VALID_CHOICES = ["r", "paper", "scissors", "spock", "lizard"]

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == "r" && second == "scissors") ||
    (first == "paper" && second == "r") ||
    (first == "scissors" && second == "paper") ||
    (first == "lizard" && second == "paper") ||
    (first == "r" && second == "lizard") ||
    (first == "scissors" && second == "lizard") ||
    (first == "spock" && second == "scissors") ||
    (first == "lizard" && second == "spock") ||
    (first == "paper" && second == "spock") ||
    (first == "spock" && second == "r")
end

def score(player, computer)
  if win?(player, computer)
    user << 1
  else win?(computer, player)
    comp << 1
  end
end


def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer win. LOL!")
  else
    prompt("It's a tie!")
  end
end

loop do 
  5.times  do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = ["r", "paper", "scissors", "spock", "lizard"].sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_result(choice, computer_choice)
    score(choice, computer_choice)
    prompt("User: #{user.count}, Computer: #{comp.count}")  
  end
    prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?("y")
end

prompt("So long sucka!")
