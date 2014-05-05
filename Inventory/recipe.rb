class Recipe
  @materials
  @result
  @difficulty

  def initialize(mats, res, dif)
    @materials = mats
    @result = res
    @difficulty = dif
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
end