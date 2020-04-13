# Заполнить массив числами фибоначчи до 100
fibonacci = [0, 1]
next_num = 1
while (next_num = fibonacci[-1] + fibonacci[-2]) <= 100
  fibonacci << next_num
end
puts "Fibonacci numbers: #{fibonacci}"