class Recipe
  @id
  @materials
  @result
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
    return @materials
  end

  def difficulty
    return @difficulty
  end

  def can_craft(inventory)
    @materials.each {
      |x|
      count = x.amount
      for i in 0..Inventory.max_slots
        item = inventory.get_item(i)
        if(item != nil)
          if(item.id == x.type)
            count = count - item.stack
            if(count <= 0)
              break
            end
          end
        end
      end

      if(count > 0)
        return false
      end
    }

    return true
  end

  def to_string
    return "Recipe id: #{@id} creates #{@result.to_string}"
  end
end