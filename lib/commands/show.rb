# encoding: utf-8

module Commands
  class Show
    class << self
      def execute(_args, bitmap)
        bitmap.nil? ? empty_message : print(bitmap)
        bitmap
      end

      def empty_message
        puts 'No bitmap has been created'
      end

      def print(bitmap)
        puts bitmap.matrix.map(&:join).join("\n")
      end
    end
  end
end
