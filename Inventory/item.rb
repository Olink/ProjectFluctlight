class Item
  @id = 0
  @name = ''
  @price = 0
  @sell = 0
  @stack = 0

  def initialize(id, name, price, sell, stack)
    @id = id
    @name = name
    @price = price
    @sell = sell
    @stack = stack
  end

  def consume
    @stack = @stack - 1
  end

  def to_string
    return "#{@stack} #{@name}(s) costs #{@price} and sells for #{@sell} each."
  end

  #accessors
  def id
    return @id
  end

  def stack
    return @stack
  end
end