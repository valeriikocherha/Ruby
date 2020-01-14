cart = {}
sum = 0

loop do
  print "Введите название товара (или \"stop\"): "
  name = gets.chomp
  break if name == "stop"
  print "цену: "
  price = gets.chomp.to_f
  print "кол-во: "
  count = gets.chomp.to_f

  cart[name] = {"price" => price, "count" => count}
end

cart.each do |name, hash|
  price_name = hash["price"] * hash["count"]
  sum += price_name
end

puts cart
puts "Итого: #{sum}"
