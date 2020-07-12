class Candy
  attr_accessor :candy_name, :is_shelved

  def initialize(candyName)
    @candy_name = candyName
    @is_shelved = false
  end

  def set_shelf_status(shelf)
    @is_shelved = shelf
  end

end