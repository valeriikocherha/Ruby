puts "Уведіть три сторони трикутника: "
arr = []
arr[0] = gets.chomp.to_f
arr[1] = gets.chomp.to_f
arr[2] = gets.chomp.to_f
puts "Уведені довжини сторін #{arr}"

if arr[0]**2 + arr[1]**2 == arr[2]**2
  puts "Це прямокутний трикутник, гіпотенуза - #{arr[2]}"
elsif arr[0]**2 + arr[2]**2 == arr[1]**2
  puts "Це прямокутний трикутник, гіпотенуза - #{arr[1]}"
elsif arr[1]**2 + arr[2]**2 == arr[0]**2
  puts "Це прямокутний трикутник, гіпотенуза - #{arr[0]}"
else
  puts "Цей трикутник не прямокутний"
end
