load 'candy.rb'

class Shelf
  attr_accessor :shelf_id, :is_displayed, :candy_list

  def initialize(shelf_id)
    @shelf_id = shelf_id
    @is_displayed = true
    @candy_list = Array.new
  end

  def shelve_candy(candy_name)
    if candy_name.is_shelved == false
      @candy_list.push(candy_name)
      candy_name.set_candy_display(true)
      puts "Shelved candy."
    else puts "That candy has already been shelved."
    end
  end

  def unshelve_candy(candy_name)
    candy_name.set_candy_display(false)
    index = @candy_list.find_index(candy_name)
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
  end

end