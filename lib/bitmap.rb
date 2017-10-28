# encoding: utf-8

class Bitmap
  BITMAP_MAX_LIMIT = 250
  BITMAP_MIN_LIMIT = 1

  attr_reader :matrix

  def initialize(width, height)
    @width = width&.to_i
    @height = height&.to_i
    @matrix = create_bitmap(width, height)
  end

  def create_bitmap(width, height)
    out_of_limits_message if invalied_coordinates?(width, height)
    Array.new(height.to_i) { Array.new(width.to_i, 'O') }
  end

  def clear
    matrix.map { |row| row.fill('O') }
  end

  def set_matrix_color(x, y, colour)
    x = x.to_i
    y = y.to_i
    wrong_coordinates_message(x, y) if out_of_limit?(x, @width) || out_of_limit?(y, @height)
    no_color_message if colour.nil?
    @matrix[y - 1][x - 1] = colour
  end

  def set_vertical_line_color(x, y1, y2, colour)
    x = x.to_i
    y1 = y1.to_i
    y2 = y2.to_i
    out_of_limits_message if vertical_line_out_of_limit?(x, y1, y2)
    no_color_message if colour.nil?
    @matrix[(y1 - 1)..(y2 - 1)].map { |row| row[x - 1] = colour }
  end

  private

  def vertical_line_out_of_limit?(x, y1, y2)
    out_of_limit?(x, @width) || out_of_limit?(y1, @height) || out_of_limit?(y2, @height)
  end

  def no_color_message
    raise StandardError, 'Color not provided'
  end

  def out_of_limits_message
    raise StandardError, 'Bitmap coordinates are out of limits'
  end

  def wrong_coordinates_message(x, y)
    raise StandardError, "Coordinates #{x}, #{y} doesn't exist in bitmap"
  end

  def invalied_coordinates?(width, height)
    out_of_limit?(width) || out_of_limit?(height)
  end

  def out_of_limit?(coordinates, max = BITMAP_MAX_LIMIT, min = BITMAP_MIN_LIMIT)
    coordinates.to_i < min&.to_i || coordinates.to_i > max&.to_i
  end
end
