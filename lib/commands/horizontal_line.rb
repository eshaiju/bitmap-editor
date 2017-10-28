# encoding: utf-8

require './lib/bitmap.rb'

module Commands
  class HorizontalLine
    class << self
      def execute(args, bitmap)
        x, y1, y2, color = args
        bitmap.set_horizontal_line_color(x, y1, y2, color)
        bitmap
      end
    end
  end
end
