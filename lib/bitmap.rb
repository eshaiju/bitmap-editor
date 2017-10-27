class Bitmap
  BITMAP_MAX_LIMIT = 250
  BITMAP_MIN_LIMIT = 1

  def initialize(width, height)
    @width = width&.to_i
    @height = height&.to_i
    @matrix = create_bitmap(width, height)
  end

  def create_bitmap(width, height)
    raise StandardError, 'Bitmap coordinates are out of limits' if invalied_coordinates?(width, height)
    Array.new(height.to_i) { Array.new(width.to_i, 'O') }
  end

  def matrix
    @matrix
  end

  private

  def invalied_coordinates?(width, height)
    out_of_limit?(width) || out_of_limit?(height)
  end

  def out_of_limit?(coordinates)
    coordinates.to_i < BITMAP_MIN_LIMIT || coordinates.to_i > BITMAP_MAX_LIMIT
  end
end
