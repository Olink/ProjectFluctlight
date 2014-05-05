require './PlayerInformation/player_stats'
require './Inventory/inventory'

class PlayerInfo
  @@initial_gold = 0

  @name = ""

  attr_accessor :stats
  attr_accessor :gold
  attr_accessor :inventory

  def initialize(name)
    @name = name
    @gold = @@initial_gold
    @stats = PlayerStats.new
    @inventory = Inventory.new
  end

  def print
    puts("User #{@name} Gold: #{@gold}")
    @stats.print
    @inventory.print
  end
end