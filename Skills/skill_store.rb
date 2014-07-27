require './Skills/skill'

class SkillStore
  @@skill_list

  def initialize(root_path)
    @@skill_list = Hash.new
    read_files(root_path)
  end

  def read_files(root_path)
    if(!Dir.exists?(root_path))
      return
    end
    Dir.entries(root_path).each{ |filename|
      if(File.exists?(File.join(root_path, filename)) and File.extname(filename) == '.json')
        contents = ''
        File.open(File.join(root_path, filename), "r") do |f|
          f.each_line do |line|
            contents = contents + line
          end
        end
        json_item = JSON.parse(contents)
        skill = Skill.new(json_item['name'], json_item['exp_needed'], json_item['prerequisite'], json_item['hidden'])
        @@skill_list[skill.name] = skill
      end
    }
  end

  def self.get_skill(name)
    if(@@skill_list.has_key?(name))
      skill = @@skill_list[name]
      return Skill.new(skill.name, skill.exp_needed, skill.prerequisite, skill.hidden)
    end

    return nil
  end

  def self.check_unlocks(skillset)
    @@skill_list.each{
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
            skillset.skills[key] = SkillWrapper.new(key, 0, 0)
          end
        end
    }
  end

  def print()
    @@skill_list.each{
        |key, value| puts(value.to_string)
    }
  end
end