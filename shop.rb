load 'candy.rb'
load 'shelf.rb'

class Shop
  attr_accessor :shelf_list, :candy_list

  def initialize
    @shelf_list = Array.new
    @candy_list = Array.new
  end

  def add_candy(candy_name)
    if !@candy_list.include?(candy_name)
      new_candy = Candy.new(candy_name)
      @candy_list.push(new_candy)
    end
  end

  def add_shelf
    index = get_next_shelf_index
    new_shelf = Shelf.new(index)
    @shelf_list.push(new_shelf)
    new_shelf.set_shelf_display(true)
  end

  def remove_shelf(shelf_id)
    index = @shelf_list.index(shelf_id)
    shelf_id.set_shelf_status(false)

    @shelf_list.delete_at(index)
  end

  def get_next_shelf_index
    return (@shelf_list.length + 1)
  end

  def access_shelf(shelf_id)
    shelf_index = @shelf_list.index{|shelf| shelf.shelf_id == shelf_id}
    return @shelf_list[shelf_index]
  end

  def list_displayed_shelves
    @shelf_list.each{|shelf| shelf.is_displayed == true
      puts shelf.shelf_id
    }
  end

  def print_shelf_contents
    @shelf_list.each{|shelf| shelf.is_displayed == true
      puts shelf.print_candies
    }
    puts
  end

  def print_all_candies
    @candy_list.each{|candy|
      puts candy.candy_name
    }
    puts
  end

end