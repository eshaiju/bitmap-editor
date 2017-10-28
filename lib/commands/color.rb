# encoding: utf-8

require './lib/bitmap.rb'

module Commands
  class Color
    class << self
      def execute(args, bitmap)
        x, y, color = args
        bitmap.set_matrix_colour(x, y, color)
        bitmap
      end
    end
  end
end
