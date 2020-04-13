# The Ideal weight.
puts "What's your name?"
name = gets.chomp
puts "What's your height?"
height = gets.chomp.to_i
ideal_weight = (height - 110) * 1.15
if ideal_weight.negative? # ideal_weight < 0
  puts 'You weight already optimal!'
else
  puts "#{name}, your weight is #{ideal_weight} and it's awesome!"
end
