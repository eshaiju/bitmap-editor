# encoding: utf-8

require './lib/bitmap.rb'
require './lib/error_notification.rb'

module Commands
  class Show
    extend ErrorNotification

    class << self
      def execute(_args, bitmap)
        bitmap.nil? ? bitmap_not_found : print(bitmap)
        bitmap
      end

      def print(bitmap)
        puts bitmap.matrix.map(&:join).join("\n")
      end
    end
  end
end
