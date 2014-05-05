class Item
  @name = ''
  @price = 0
  @sell = 0
  @stack = 0

  def initialize(name, price, sell, stack)
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
  def stack
    return @stack
  end
end