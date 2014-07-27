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