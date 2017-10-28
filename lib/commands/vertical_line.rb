# encoding: utf-8

require './lib/bitmap.rb'

module Commands
  class VerticalLine
    extend ErrorNotification

    class << self
      def execute(args, bitmap)
        x, y1, y2, color = args
        # swaping bigger value to y2
        y1, y2 = y2, y1 if y1.to_i > y2.to_i
        bitmap.nil? ? bitmap_not_found : bitmap.set_vertical_line_color(x, y1, y2, color)
        bitmap
      end
    end
  end
end
