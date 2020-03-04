# Area of a triangle. User enters the sides of triangle and get the area of a triangle.
puts 'Enter the side a of the triangle:'
a = gets.chomp.to_f # if we use a "to_i" method or another "to...",or don't use it, our results will be not exact. Or program will don't work properly. 
puts 'Enter the side b of the triangle:'
b = gets.chomp.to_f
triangle_area = 0.5 * a * b
puts "The area of a triangle is #{triangle_area}!"
