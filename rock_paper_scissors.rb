VALID_CHOICES = ["r", "paper", "scissors", "spock", "lizard"]
user_score = 0
computer_score = 0

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

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer win. LOL!")
  else
    prompt("It's a tie!")
  end
end

#actual program

prompt("Welcome to #{VALID_CHOICES.join(', ')}!")
loop do
  until user_score == 5 || computer_score == 5
    choice = ''
    computer_choice = VALID_CHOICES.sample

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()

        if VALID_CHOICES.include?(choice)
          break
        else
          prompt("That's not a valid choice.")
        end
    end

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
    display_result(choice, computer_choice)
      
      if win?(choice, computer_choice)
       user_score += 1
      else win?(computer_choice, choice)
       computer_score += 1
      end
    prompt("User: #{user_score}, Computer: #{computer_score}")  
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  if answer.downcase.include?("n")
    break
  else
    user_score = 0
    computer_score = 0
  end
end
prompt("Thank you for playing!")