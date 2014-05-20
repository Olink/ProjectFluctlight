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

  def self.skill_list
    @@skill_list
  end

  def self.get_skill(name)
    @@skill_list[name]
  end
end