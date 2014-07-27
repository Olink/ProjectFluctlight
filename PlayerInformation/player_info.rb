require './PlayerInformation/player_stats'
require './Inventory/inventory'
require './Skills/skill_set'

class PlayerInfo
  @@initial_gold = 0

  @name = ''

  attr_accessor :stats
  attr_accessor :gold
  attr_accessor :inventory
  attr_accessor :skill_set

  def initialize(name)
    @name = name
    @gold = @@initial_gold
    @stats = PlayerStats.new
    @inventory = Inventory.new
    @skill_set = SkillSet.new
    SkillStore.check_unlocks(@skill_set)
  end

  def print
    puts("User #{@name} Gold: #{@gold}")
    @stats.print
    @inventory.print
    @skill_set.print
  end
end