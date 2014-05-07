class Skill
  @name = ""
  @exp_needed = Array.new
  @prerequisite = Hash.new
  @hidden = false

  def initialize(name, exp, pre, hidden)
    @name = name
    @exp_needed = exp
    @prerequisite = pre
    @hidden = hidden
  end

  def name
    @name
  end

  def exp_needed
    @exp_needed
  end

  def prerequisite
    @prerequisite
  end

  def hidden
    @hidden
  end

  def to_string
    "#{@name} - Hidden: #{@hidden}"
  end
end