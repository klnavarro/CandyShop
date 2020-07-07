class Candy
  attr_accessor :candyName, :isShelved

  def initialize(candyName)
    @candyName = candyName
    @isShelved = false
  end

  def set_shelf_status(shelf)
    @isShelved = shelf
  end


end