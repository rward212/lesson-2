def prompt(message)
    Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def valid_operator?(num)
  num.to_i >= 1 && num.to_i <= 4
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2' 
    'Subtracting'
  when '3'
    'multiplying'
  when '4'
    'dividing'
  end
end

number1 = nil
number2 = nil
operator = nil
answer = nil
name = nil

prompt("Welcome to Calculator! Please enter your name.")

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Please enter a valid name")
  else
    break
  end 
end

prompt("Hello #{name}")

loop do
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("I'm sorry, that is not a valid number. Please try again.")
    end    
  end

  loop do
    prompt("Whats the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("I'm sorry, that is not a valid number. Please try again.")
    end
  end


  operator_prompt = <<-MSG
    What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
  MSG

  prompt(operator_prompt)


  loop do
  operator = Kernel.gets().chomp()

    if valid_operator?(operator)
      break
    else
      prompt("I'm sorry, that doesn't appear to be a valid choice. Please make another selection.")
    end

  end

prompt("#{operation_to_message(operator)} the two numbers...")
Kernel.sleep(3)



  result = case operator
    when "1"
      number1.to_i() + number2.to_i()
    when "2"
      number1.to_i() - number2.to_i()
    when "3"
      number1.to_i() * number2.to_i()
    else "4"
      number1.to_f() / number2.to_f()
  end 

  prompt("The result is #{result}.")

  prompt("Do you want to perform another calculation [y/n]?")
  answer = Kernel.gets().chomp()
  break unless answer == "y"

end

prompt("Thank you for using the calculator.")
