# encoding: utf-8

class Bitmap
  BITMAP_MAX_LIMIT = 250
  BITMAP_MIN_LIMIT = 1

  attr_reader :matrix, :width, :height

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
    verify_inputs(x, y, colour)
    matrix[y - 1][x - 1] = colour
  end

  def set_vertical_line_color(x, y1, y2, colour)
    x = x.to_i
    y1 = y1.to_i
    y2 = y2.to_i
    out_of_limits_message if vertical_line_out_of_limit?(x, y1, y2)
    no_color_message if colour.nil?
    matrix[(y1 - 1)..(y2 - 1)].map { |row| row[x - 1] = colour }
  end

  def set_horizontal_line_color(x1, x2, y, colour)
    x1 = x1.to_i
    x2 = x2.to_i
    y = y.to_i
    out_of_limits_message if horizontal_line_out_of_limit?(x1, x2, y)
    no_color_message if colour.nil?
    matrix[y - 1].fill(colour, (x1 - 1)..(x2 - 1))
  end

  def flood_fill(x, y, colour)
    x = x.to_i
    y = y.to_i
    verify_inputs(x, y, colour)
    target_color = matrix[y - 1][x - 1]
    fill_neighbours(x, y, target_color, colour)
  end

  private

  def verify_inputs(x, y, colour)
    wrong_coordinates_message(x, y) if out_of_limit?(x, width) || out_of_limit?(y, height)
    no_color_message if colour.nil?
  end

  def fill_color(x, y, target_color, replacement_color)
    return if target_color == replacement_color
    return if fill_color_out_of_limit(x, y) || (matrix[y - 1][x - 1] != target_color)
    matrix[y - 1][x - 1] = replacement_color
    fill_nighboures(x, y, target_color, replacement_color)
  end

  def fill_neighbours(x, y, target_color, replacement_color)
    fill_color(x + 1, y, target_color, replacement_color)
    fill_color(x - 1, y, target_color, replacement_color)
    fill_color(x, y + 1, target_color, replacement_color)
    fill_color(x, y - 1, target_color, replacement_color)
  end

  def fill_color_out_of_limit(x, y)
    out_of_limit?(x, width) || out_of_limit?(y, height)
  end

  def horizontal_line_out_of_limit?(x1, x2, y)
    out_of_limit?(x1, width) || out_of_limit?(x2, width) || out_of_limit?(y, height)
  end

  def vertical_line_out_of_limit?(x, y1, y2)
    out_of_limit?(x, width) || out_of_limit?(y1, height) || out_of_limit?(y2, height)
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
