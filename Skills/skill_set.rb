require './Skills/skill_wrapper'
require './Skills/skill_store'

class SkillSet
  @skills

  def initialize
    @skills = Hash.new
  end

  def check_unlocks()
    skill_store = SkillStore.skill_list
    skill_store.each {
      |key, value|
      if(!value.hidden)
        should_unlock = true
        value.prerequisite.each {
          |key2, value2|
          if(@skills[key2] != nil)
            if(@skills[key2].level < value2)
              should_unlock = false
              break
            end
          else
            should_unlock = false
            break
          end
        }

        if(should_unlock)
          @skills[key] = SkillWrapper.new(key, 0, 0)
        end
      end
    }
  end

  def skills
    @skills
  end

  def print
    puts('Skills:')
    @skills.each {
      |key, value|
        value.print
    }
  end
end
