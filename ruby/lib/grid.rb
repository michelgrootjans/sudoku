require 'cell'

class Grid
  attr_accessor :name

  def initialize
    @cells = []

    (0..2).each do |row|
      @cells[row] = []
      (0..1).each do
        @cells[row] << Cell.new
      end
    end
  end

  def solved
    false
  end

  def set_value row, column, value
    cells.each do |cell|
      cell.disable value
    end
    cell(row, column).value = value
  end

  def value_of row, column
    cell(row, column).value
  end

  def possible_values_of row, column
    cell(row, column).possible_values
  end

private
  def cell row, column
    @cells[row - 1][column - 1]
  end

  def cells
    @cells.flatten
  end
end