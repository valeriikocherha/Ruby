fib = [0, 1]

loop do
  fib1 = fib[-2] + fib[-1]
  break if fib1 > 100
  fib << fib1
end

puts fib
