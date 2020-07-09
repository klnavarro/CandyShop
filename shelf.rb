load 'candy.rb'


class Shelf
  attr_accessor :shelf_id, :is_displayed, :candy_list

  def initialize()
    @is_displayed = false
    @candy_list = Array.new
  end

  def shelf_candy(candy)
    @candy_list.push(candy)
    candy.set_shelf_status(true)
  end

  def unshelf_candy(candy)

    @candy_list.delete_at(index)
  end

  def set_shelf_display(option)
    @is_displayed = option
  end

  def print_candies()
    candy_list.each { |candy|
      puts candy.candy_name
    }
    puts
  end

end