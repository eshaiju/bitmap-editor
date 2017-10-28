# encoding: utf-8

require './lib/parser'

class BitmapEditor
  attr_reader :parser

  def initialize
    @bitmap = nil
    @parser = Parser.new
  end

  def run(file)
    raise StandardError, 'Please provide correct file' if file?(file)

    File.open(file).each do |line|
      line = line.chomp
      @bitmap = parser.parse(line, @bitmap)
    end
  end

  private

  def file?(file)
    file.nil? || !File.exist?(file)
  end
end
