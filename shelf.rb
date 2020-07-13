load 'candy.rb'

class Shelf
  attr_accessor :shelf_id, :is_displayed, :candy_list

  def initialize(shelf_id)
    @shelf_id = shelf_id
    @is_displayed = true
    @candy_list = Array.new
  end

  def shelve_candy(candy)
    @candy_list.push(candy)
    candy.set_candy_display(true)
  end

  def unshelve_candy(candy)
    index = @candy_list.find_index(candy)
    candy.set_candy_display(false)
    @candy_list.delete_at(index)
  end

  def set_shelf_display(option)
    @is_displayed = option
  end

  def count_candies
    @candy_list.count
  end

  def print_candies
    @candy_list.each{|candy|
      puts candy.candy_name
    }
    puts
  end

end