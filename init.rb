load 'candy.rb'
load 'shelf.rb'
load 'shop.rb'

puts "Hello! Enter a candy.\n"
candyName = gets.chomp
candy = Candy.new(candyName)