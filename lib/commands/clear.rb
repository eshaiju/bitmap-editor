# encoding: utf-8

require './lib/bitmap.rb'
require './lib/error_notification.rb'

module Commands
  class Clear
    extend ErrorNotification

    class << self
      def execute(_args, bitmap)
        bitmap.nil? ? bitmap_not_found : bitmap.clear
        bitmap
      end
    end
  end
end
