# encoding: utf-8

require './lib/bitmap.rb'
require './lib/error_notification.rb'

module Commands
  class HorizontalLine
    extend ErrorNotification

    class << self
      def execute(args, bitmap)
        x1, x2, y, color = args
        # swaping bigger value to y2
        x1, x2 = x2, x1 if x1.to_i > x2.to_i
        bitmap.nil? ? bitmap_not_found : bitmap.set_horizontal_line_color(x1, x2, y, color)
        bitmap
      end
    end
  end
end
