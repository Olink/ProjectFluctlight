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

  def can_craft(inventory)
    @materials.each {
      |x|
      count = x.amount
      for i in 0..Inventory.max_slots
        item_wrapper = inventory.get_item(i)
        if(item_wrapper != nil)
          if(item_wrapper.item.id == x.type)
            count = count - item_wrapper.stack
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
    output = "Recipe id: #{@id} creates"
    @result.each {
      |x| output = output + " #{x.to_string}"
    }
    return output
  end
end