require './lib/parser'

class BitmapEditor
  attr_reader :parser

  def initialize
    @bitmap = [['O','O'],['O','Z']]
    @parser = Parser.new
  end

  def run(file)
    raise StandardError, 'Please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      @bitmap = parser.parse(line, @bitmap)
    end
  end
end
