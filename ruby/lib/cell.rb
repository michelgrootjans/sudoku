class Cell

  def initialize
    @possible_values = [1, 2, 3, 4, 5, 6]
  end

  def value
    :unknown
  end

  def solved
    false
  end

  def disable value
    @possible_values.delete value
  end

  def possible_values
    @possible_values
  end
end