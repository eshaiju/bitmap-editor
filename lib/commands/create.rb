require './lib/bitmap.rb'

module Commands
  class Create
    class << self
      def execute(args, _bitmap)
        width, height = args
        Bitmap.new(width, height)
      end
    end
  end
end
