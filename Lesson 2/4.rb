# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
hash = {}
alphabet = ('a'..'z').to_a
vowels = %w[a e i o u]
alphabet.each.with_index(1) { |letter, i| hash[letter] = i if vowels.include? letter }
puts hash