class ItemWrapper
  @item
  @stack

  def initialize(item, stack)
    @item = item
    @stack = stack
  end

  def consume
    @stack = @stack - 1
  end

  def to_string
    "#{@stack} of #{@item.to_string}"
  end

  #accessors
  def item
    @item
  end

  def stack
    @stack
  end
end