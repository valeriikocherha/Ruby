puts "Яке ваше ім'я?"
name = gets.chomp
puts "Який ваший зріст?"
height = gets.chomp
mass = height.to_f - 110

if  mass > 0
  puts "#{name}, ваша вага повинна бути #{mass}"
else
  puts "#{name}, ваша вага в нормі!"
end
