# Заполнить массив числами фибоначчи до 100
fibonacci = [0, 1]
next_num = 1
until next_num >= 100
  fibonacci << next_num
  next_num = fibonacci[-1] + fibonacci[-2]
end
puts "Fibonacci numbers: #{fibonacci}"