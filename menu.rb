load 'shop.rb'
load 'shelf.rb'

class Menu

  def initialize(shop)
    run_shop_menu(true, shop)
  end

  def run_shop_menu(is_running, shop)
    if is_running
      puts "Welcome to the shop. There are #{shop.count_shelves} shelves.\nSelect an option:\n1: Add candy\n2: Add shelf\n3: Edit shelf\n4: Remove shelf\n5: View all candies\n6: View shelved candies\n7: Exit"

      option = gets.chomp

      case option
      when "1"
        add_shop_candy(shop)
      when "2"
        shop.add_shelf
        puts "Added shelf."
      when "3"
        edit_shop_shelf(shop)
      when "4"
        remove_shop_shelf(shop)
      when "5"
        shop.print_all_candies
      when "6"
        shop.print_shelf_contents
      when "7"
        is_running = false
      else
        puts "Please enter a valid command."
      end

      run_shop_menu(is_running, shop)
    end
  end

  def run_shelf_menu(is_running, shelf, shop)
    if is_running
      puts "There are #{shelf.count_candies} candies. Select an option (Enter number):\n1: Shelve candy\n2: Unshelve candy\n3: View candies\n4: Return to shop"

      option = gets.chomp

      case option
      when "1"
        shelve_candy(shop, shelf)
      when "2"
        unshelve_candy(shop, shelf)
      when "3"
        shelf.print_candies
      when "4"
        puts "Leaving shelf view."
        is_running = false
      else
        puts "Please enter a valid command."
      end

      run_shelf_menu(is_running, shelf, shop)
    end
  end

  def add_shop_candy(shop)
    puts "Enter candy name:"
    candy_name = gets.chomp
    shop.add_candy(candy_name)
  end

  def edit_shop_shelf(shop)
    if !shop.shelf_list.empty?
      puts "Select a shelf:"
      shop.list_displayed_shelves
      selection = gets.chomp.to_i

      if shop.shelf_list.any?{|shelf| shelf.shelf_id == selection}
        index = shop.get_shelf_index(selection)
        puts "You've selected a shelf to edit."
        run_shelf_menu(true, shop.shelf_list.at(index), shop)

      else puts "The shelf you've selected doesn't exist"
      end

    else puts "There are no shelves."
    end
  end

  def remove_shop_shelf(shop)
    if !shop.shelf_list.empty?
      puts "Which shelf would you like to remove?"
      shop.list_displayed_shelves

      selection = gets.chomp.to_i

      if shop.shelf_list.any?{|shelf| shelf.shelf_id == selection}
        shop.remove_shelf(selection)
        puts "Removed shelf #{selection}."
      else puts "The shelf doesn't exist."
      end

    else puts "There are no shelves."
    end
  end

  def shelve_candy(shop, shelf)
    if !shop.candy_list.empty?
      puts "These candies haven't been shelved:"
      shop.print_unshelved_candies
      puts "Which candy would you like to shelf? (enter candy name)"

      selection = gets.chomp
      if shop.candy_list.any?{|candy| candy.candy_name.casecmp?(selection)}
        shelf.shelve_candy(shop.get_candy(selection))
      else puts "The candy you've entered can't be found."
      end
    else puts "There are no candies to shelve"
    end
  end

  def unshelve_candy(shop, shelf)
    if !shelf.candy_list.empty?
      puts "Which candy would you like to unshelve?"

      shelf.print_candies

      selection = gets.chomp
      if shelf.candy_list.any?{|candy| candy.candy_name.casecmp?(selection)}
        shelf.unshelve_candy(shop.get_candy(selection))
      else puts "The candy you've selected is not in this shelf."
      end

      puts "Unshelved candy."
    end
  end
end