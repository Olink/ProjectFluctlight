require './Skills/skill_wrapper'
require './Skills/skill_store'

class SkillSet
  @skills

  def initialize
    @skills = Hash.new
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
