load 'shop.rb'
load 'shelf.rb'

class Menu

  def initialize(shop)
    run_shop_menu(true, shop)
  end

  def run_shop_menu(is_running, shop)
    puts "Welcome to the shop.
      Select an option:
      1: Add candy
      2: Add shelf
      3: Edit shelf
      4: Remove shelf
      5: View all candies
      6: View shelved candies
      7: Exit"

    option = gets.chomp

    case option
    when "1"
      puts "Enter candy name:"
      candy_name = gets.chomp
      shop.add_candy(candy_name)
      puts "Added candy."

    when "2"
      shop.add_shelf
      puts "Added shelf."

    when "3"
      puts "Select a shelf:"
      shop.list_displayed_shelves
      shelf_option = gets.chomp
      puts "You've selected a shelf to edit."
      run_shelf_menu(true, shop.shelf_list[shelf_option], shop.candy_list)

    when "4"
      puts "Which shelf would you like to remove?"
      shop.list_displayed_shelves
      selection = gets.chomp
      shop.remove_shelf(selection)
      puts "Removed shelf #{selection}"

    when "5"
      shop.print_all_candies

    when "6"
      shop.print_shelf_contents

    when "7"
      is_running = false
    end

    run_shop_menu(is_running, shop)
  end

  def run_shelf_menu(is_running, shelf, candy_list)
    puts "Select an option:
      1: Shelf candy
      2: Unshelf candy
      3: View candies
      4: Return to shop"

    option = gets.chomp

    case option
    when "1"
      shelf.shelf_candy
      puts "Shelved candy."
    when "2"
      shelf.unshelf_candy
      puts "Unshelved candy"
    when "3"
      shelf.print_candies
    when "4"
      puts "Leaving shelf view."
      is_running = false
    end

    run_shelf_menu(is_running, shelf, candy_list)
  end
end