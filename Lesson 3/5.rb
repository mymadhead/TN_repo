# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 
puts 'Enter the date'
puts 'Day:'
day = gets.chomp.to_i
puts 'Month:'
month = gets.chomp.to_i
puts 'Year:'
year = gets.chomp.to_i
months = {
    jan: 31,
    feb: 28,
    mar: 31,
    apr: 30,
    may: 31,
    jun: 30,
    jul: 31,
    aug: 31,
    sep: 30,
    oct: 31,
    nov: 30,
    dec: 31
}
if ((year % 4 == 0) && !(year % 100 == 0 )) || (year % 400 == 0)
  months[:February] = 29
end
present_date = months.values.take(month - 1).push(day).sum
puts "Today #{present_date}-th day."