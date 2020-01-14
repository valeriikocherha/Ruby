puts "Уведіть сторони триутника:"
puts "Уведіть 1 сторону:"
side1 = gets.chomp
puts "Уведіть 2 сторону:"
side2 = gets.chomp
puts "Уведіть 3 сторону:"
side3 = gets.chomp
if side1.to_f**2 + side2.to_f**2 == side3.to_f**2
  puts "Це прямокутний трикутник, гіпотенуза - 3 сторона"
elsif side1.to_f**2 + side3.to_f**2 == side2.to_f**2
  puts "Це прямокутний трикутник, гіпотенуза - 2 сторона"
elsif side.to_f**2 + side3.to_f**2 == side1.to_f**2
  puts "Це прямокутний трикутник, гіпотенуза - 1 сторона"
elsif side1.to_f == side2.to_f && side2.to_f == side3.to_f
  puts "Це рівносторонній трикутник. Щоб скористуваться теоремою Піфагора потрібно спочатку знайти найдовшу сторону"
else
  puts "Цей трикутник різносторонній."
end
