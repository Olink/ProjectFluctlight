require 'json'

require './Inventory/item'

class ItemStore
  @item_store
  def initialize(root_path)
    @item_store = Hash.new
    read_files(root_path)
  end

  def read_files(root_path)
    Dir.entries(root_path).each{ |filename|
      if(File.exists?(File.join(root_path, filename)) and File.extname(filename) == '.json')
        contents = ''
        File.open(File.join(root_path, filename), "r") do |f|
          f.each_line do |line|
            contents = contents + line
          end
        end
        json_item = JSON.parse(contents)
        item = Item.new(json_item['id'], json_item['name'], json_item['price'], json_item['sell'], json_item['stack'])
        @item_store[item.id] = item
      end
    }
  end

  def item_store
    return @item_store
  end
end