class Candy
  attr_accessor :candy_name, :is_shelved

  def initialize(candy_name)
    @candy_name = candy_name
    @is_shelved = false
  end

  def set_candy_display(option)
    @is_shelved = option
  end

end