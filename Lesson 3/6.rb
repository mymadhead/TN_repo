# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
shopping_cart = {}
total_price = {}

loop do
  puts 'Enter a product: '
  product = gets.chomp
  break if product == 'stop'

  puts "Enter a price for one #{product}: "
  price = gets.chomp.to_f
  puts "Enter quantity of #{product}: "
  quantity = gets.chomp.to_f
  product_price_quantity = { product => { price => quantity } }
  shopping_cart.merge!(product_price_quantity)
  total_price.store(product, (price * quantity))
end

puts "Shoping cart: #{shopping_cart}"
total_price.each { |product, product_total_price| puts "Total price for #{product} is: #{product_total_price}." }
