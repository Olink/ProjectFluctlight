require './Inventory/item'

class Inventory
  @@max_size = 10

  def initialize
    @inventory = Array.new(@@max_size)
  end

  def get_item(slot)
    if(slot < @@max_size)
      return @inventory[slot]
    end

    return nil
  end

  def put_item(slot, item)
    if(slot < @@max_size && item != nil)
      @inventory[slot] = item
    end
  end

  def consume(slot)
    if(slot < @@max_size and @inventory[slot] != nil)
      @inventory[slot].consume
      if(@inventory[slot].stack <= 0)
        @inventory[slot] = nil
      end
    end
  end

  def consume_from_slot(slot, amount)
    for i in 0..(amount - 1)
      consume(slot)
    end
  end

  def consume_item_amount(itemid, amount)
    amount_left_to_consume = amount
    @inventory.each_with_index {
      |x, id| if (x != nil)
                if (@inventory[id].item.id == itemid)
                  amount_we_can_take = [amount_left_to_consume, @inventory[id].stack].min
                  consume_from_slot(id, amount_we_can_take)
                  amount_left_to_consume = amount_left_to_consume - amount_we_can_take
                  if(amount_we_can_take >= amount)
                    break;
                  end
                end
              end
    }
  end

  def add_item(item)
    if(item != nil)
      @inventory.each_with_index{
          |x, id| if(x == nil)
                    @inventory[id] = item
                    return
                  end
      }
    end
  end

  def can_craft(recipe)
    recipe.materials.each {
        |x|
      count = x.amount
      @inventory.each { |item_wrapper|
        if (item_wrapper != nil)
          if (item_wrapper.item.id == x.type)
            count = count - item_wrapper.stack
            if (count <= 0)
              break
            end
          end
        end
      }

      if(count > 0)
        return false
      end
    }

    return true
  end

  def craft(recipe)
    if(can_craft(recipe))
      recipe.materials.each {
        |mat| consume_item_amount(mat.type, mat.amount)
      }
    end
  end

  def print
    puts("Inventory:")
    @inventory.each_with_index {
        |x, id| if(x.kind_of?(ItemWrapper) and x != nil)
              puts("\t#{id + 1}: #{x.to_string}")
            elsif
              puts("\t#{id + 1}: Empty")
            end
    }
  end

  def self.max_slots
    return @@max_size
  end
end