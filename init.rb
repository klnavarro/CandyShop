load 'candy.rb'

puts "Hello! Enter a candy.\n"
candyName = gets.chomp
candy = Candy.new(candyName)