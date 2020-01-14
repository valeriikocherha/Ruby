puts "Введите число: "
date = gets.to_i
puts "Введите месяц: "
month = gets.to_i
puts "Введите год: "
year = gets.to_i

if ( year % 400 == 0 || year % 4 == 0 && year % 100 != 0 )
  february = 29
else
  february = 28
end

months = [31, february, 31, 30, 31, 30, 31, 31, 30, 31, 30,31]

months = months.first(month - 1)
days = months.inject(date){ |date, days| date + days }
puts "Количество дней: #{days}"
