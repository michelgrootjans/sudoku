class Cell
  attr_reader :possible_values

  def initialize
    @possible_values = [1, 2, 3, 4, 5, 6]
  end

  def value= value
    @possible_values = [value]
  end

  def value
    return @possible_values.first if solved?
    return :impossible if impossible
    :unknown
  end

  def solved?
    @possible_values.size == 1
  end

  def disable value
    @possible_values.delete value
  end

private
  def impossible
    @possible_values.size < 1
  end
end