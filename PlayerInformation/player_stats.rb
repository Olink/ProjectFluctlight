class PlayerStats
  @@initial_health = 100
  @@initial_base_state = 10

  attr_accessor :health
  attr_accessor :max_health
  attr_accessor :strength
  attr_accessor :dexterity

  def initialize()
    @health = @@initial_health
    @max_health = @@initial_health
    @strength = @@initial_base_state
    @dexterity = @@initial_base_state
  end

  def print
    puts("Stats:")
    puts("\tHP: #{@health} / #{@max_health}")
    puts("\tStrength: #{@strength}")
    puts("\tDexterity: #{@dexterity}")
  end
end