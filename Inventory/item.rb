class Item
  @id = 0
  @name = ''
  @price = 0
  @sell = 0

  def initialize(id, name, price, sell)
    @id = id
    @name = name
    @price = price
    @sell = sell
  end

  def to_string
    return "#{@name} costs #{@price} and sells for #{@sell}."
  end

  #accessors
  def id
    return @id
  end
end