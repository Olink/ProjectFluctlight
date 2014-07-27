class Recipe
  @id
  @materials
  @result = Array.new
  @difficulty

  def initialize(id, mats, res, dif)
    @id = id
    @materials = mats
    @result = res
    @difficulty = dif
  end

  def id
    return @id
  end

  def materials
    return @materials
  end

  def result
    return result
  end

  def difficulty
    return @difficulty
  end

  def to_string
    output = "Recipe id: #{@id} creates"
    @result.each {
      |x| output = output + " #{x.to_string}"
    }
    return output
  end
end