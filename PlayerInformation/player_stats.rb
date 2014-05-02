class PlayerStats
  @@initialHealth = 100

  attr_accessor :health
  attr_accessor :maxHealth

  def initialize()
    @health = @@initialHealth
    @maxHealth = @@initialHealth
  end
end