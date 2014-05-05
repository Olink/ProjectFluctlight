class PlayerStats
  @@initial_health = 100

  attr_accessor :health
  attr_accessor :max_health

  def initialize()
    @health = @@initial_health
    @max_health = @@initial_health
  end

  def print
    puts("Stats:")
    puts("\tHP: #{@health} / #{@max_health}")
  end
end