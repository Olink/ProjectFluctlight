require './Skills/skill'
require './Skills/skill_store'

class SkillWrapper
  @name = ''
  @level = 0
  @progress = 0.0

  def initialize(name, level, progress)
    @name = name
    @level = level
    @progress = progress
  end

  def add_exp(amount)
    @progress = @progress + amount
    skill = SkillStore.get_skill(@name)
    if(skill == nil)
      return
    end

    should_level = true
    did_level = false
    while(should_level)
      if(@progress >= skill.exp_needed[@level])
        @level = @level + 1
        @progress = @progress - skill.exp_needed[@level]
        did_level = true
      else
        should_level = false
      end
    end

    return did_level
  end

  #accessors
  def name
    @name
  end

  def level
    @level
  end

  def progress
    @progress
  end
end