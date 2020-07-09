load 'candy.rb'
load 'shelf.rb'

class Shop
  attr_accessor :shelf_list, :candy_list

  def initialize
    @shelf_list = Array.new
    @candy_list = Array.new
  end

  def add_candy(candy_name)
    new_candy = Candy.new(candy_name)
    candy_list.push(new_candy)
  end

  def add_shelf()
    new_shelf = Shelf.new
    shelf_list.push(new_shelf)
  end

  def remove_shelf()

  end

  def print_shelf_contents()
    shelf_list.each { |shelf|
      puts shelf.print_candies()
    }
    puts
  end




end