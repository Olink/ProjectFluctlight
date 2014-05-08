require './Skills/skill_wrapper'

class SkillSet
  @skills = Hash.new

  def initialize(skills)
    @skills = skills
  end

  def check_unlocks()
    skill_store = [] #TODO: Get list of skills from skill store somehow (global/static variable method thing)
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
end
