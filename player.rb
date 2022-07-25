class Player
  attr_accessor :name, :life
  def initialize(name)
    @name = name
    @life = 3
  end

  def life_decrease
    @life -= 1
  end

  def dead
    @life == 0
  end

end