# The user enters 3 coefficients a, b and c. 
# The program calculates the discriminant (D) and the roots of the equation 
# (x1 and x2, if any) and displays the values of the discriminant and roots on the screen.
puts 'Enter coefficient a:'
a = gets.chomp.to_f
puts 'Enter coefficient b:'
b = gets.chomp.to_f
puts 'Enter coefficient c:'
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d >= 0
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
end

if d < 0
  puts "Discriminant = #{d}. There are no roots."
elsif d == 0 
  puts "Discriminant = #{d}. There is one root: #{x1}."
else 
  puts "Discriminant = #{d}. There are two roots: #{x1}, #{x2}."
end