class Cell

  def initialize
    @possible_values = [1, 2, 3, 4, 5, 6]
  end

  def value
    return @possible_values.first if solved
    :unknown
  end

  def solved
    @possible_values.size == 1
  end

  def disable value
    @possible_values.delete value
  end

  def possible_values
    @possible_values
  end
end