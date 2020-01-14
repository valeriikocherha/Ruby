puts "Уведіть коефіцієнти квадратного рівняння"
puts "Уведіть коефіцієнт 'a'"
a = gets.chomp
puts "Уведіть коефіцієнт 'b'"
b = gets.chomp
puts "Уведіть коефіцієнт 'c'"
c = gets.chomp

puts "Рівняння має вигляд: #{a}*x^2+#{b}*x+#{c}=0"
discriminant = b.to_i**2 - 4*a.to_i*c.to_i
puts "Дискримінант #{discriminant}"

if discriminant > 0
  sqrt = Math.sqrt(discriminant)
  x1 = (-b.to_i+sqrt)/(2*a.to_i)
  x2 = (-b.to_i-sqrt)/(2*a.to_i)
  puts "Дискримінант = #{discriminant}, корені рівняння: #{x1},   #{x2}"
end

if discriminant == 0
  sqrt = Math.sqrt(discriminant)
  x = (-b.to_i+sqrt)/(2*a.to_i)
  puts "Дискримінант = #{discriminant}, корінь рівняння: #{x}"
end

if discriminant < 0
  puts "Дискримінант = #{discriminant}, коренів рівняння немає !!!"
end
