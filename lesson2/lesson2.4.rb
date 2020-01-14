vowels_with_index = {}
vowels = ['a', 'e', 'i', 'o', 'u', 'y']

('a'..'z').each_with_index do |element, index|

  vowels_with_index[element] = index + 1 if vowels.include?(element)
end

puts vowels_with_index
