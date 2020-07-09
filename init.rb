load 'candy.rb'
load 'shelf.rb'
load 'shop.rb'


shelf = Shelf.new()
shelf.print_candies()

shop = Shop.new()
shop.add_shelf()
shop.print_shelf_contents()

puts "Hello! Enter a candy.\n"
candyName = gets.chomp
shop.add_candy(candyName)