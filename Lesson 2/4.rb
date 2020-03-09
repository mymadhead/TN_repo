# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
hash = {}
alphabet = ('a'..'z').to_a
glasnie = %w[a e i o u]
alphabet.each.with_index(1) { |e, i| hash[e] = i if glasnie.include? e }
puts hash