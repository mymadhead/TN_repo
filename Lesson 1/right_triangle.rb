sides = []
puts 'Enter first side of triangle:'
sides << gets.chomp.to_f
puts 'Enter second side of triangle:'
sides << gets.chomp.to_f
puts 'Enter third side of triangle:'
sides << gets.chomp.to_f
sides.sort!

if sides[2]**2 == sides[0]**2 + sides[1]**2
  puts 'This is a rectangular triangle.'
elsif (sides[0] == sides[1]) && (sides[1] == sides[2])
  puts 'This triangle is a equilateral triangle.'
elsif (sides[0] == sides[1]) || (sides[1] == sides[2])
  puts 'This is a isosceles triangle.'
else
  puts 'This is equilateral triangle.'
end