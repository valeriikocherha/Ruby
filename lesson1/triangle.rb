puts "Для того, щоб знайти площу трикутника нам потрібно знати основу і висоту"
puts "Уведіть довжину основи:"
basis = gets.chomp
puts "Уведіть довжину висоти:"
height = gets.chomp

area = 0.5 * basis.to_f * height.to_f
puts "Площа трикутника: #{area}"
