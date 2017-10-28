# encoding: utf-8

require './lib/bitmap.rb'

module Commands
  class Clear
    class << self
      def execute(_args, bitmap)
        bitmap.nil? ? empty_message : bitmap.clear
        bitmap
      end

      def empty_message
        puts 'No bitmap found'
      end
    end
  end
end
