require 'cell'

class Grid
  attr_accessor :name

  def initialize
    @cells = []

    (0..2).each do |row|
      @cells[row] = []
      (0..1).each do |column|
        @cells[row] << Cell.new
      end
    end
  end

  def west_channel event
    (1..2).each do |column|
      disable(get_cell(event[:row], column), event[:value])
    end
  end
  alias :east_channel :west_channel

  def south_channel event
    (1..3).each do |row|
      disable(get_cell(row, event[:column]), event[:value])
    end
  end
  alias :north_channel :south_channel

  def solved?
    cells.all?(&:solved?)
  end

  def set_value row, column, value
    cells.each { |cell| cell.disable value }
    get_cell(row, column).value = value
  end

  def value_of row, column
    get_cell(row, column).value
  end

  def possible_values_of row, column
    get_cell(row, column).possible_values
  end

private
  def disable cell, value
    return if cell.solved?

    cell.disable(value)
    return unless cell.solved?

    cells.each { |c| disable c, cell.value }
  end

  def get_cell row, column
    @cells[row - 1][column - 1]
  end

  def cells
    @cells.flatten
  end
end