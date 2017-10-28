# encoding: utf-8

require './lib/bitmap.rb'
require './lib/error_notification.rb'

module Commands
  class Color
    extend ErrorNotification

    class << self
      def execute(args, bitmap)
        x, y, color = args
        bitmap.nil? ? bitmap_not_found : bitmap.set_matrix_color(x, y, color)
        bitmap
      end
    end
  end
end
