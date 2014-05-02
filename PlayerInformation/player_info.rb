require './PlayerInformation/player_stats'

class PlayerInfo
  @@initialGold = 0

  @name = ""
  attr_accessor :stats
  attr_accessor :gold

  def initialize(name)
    @name = name
    @gold = @@initialGold
    @stats = PlayerStats.new
  end

  def print
    puts("User #{@name}\n\tGold: #{@gold}, HP:#{@stats.health}/#{@stats.maxHealth}")
  end
end