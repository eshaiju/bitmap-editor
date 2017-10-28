# encoding: utf-8

require './lib/commands/show'
require './lib/commands/create'
require './lib/commands/color'

class Parser
  attr_reader :bitmap

  def self.commands
    {
      'S' => Commands::Show,
      'I' => Commands::Create,
      'L' => Commands::Color
    }
  end

  def parse(command_string, bitmap)
    args = command_string.split
    str = args.shift
    if Parser.commands.key?(str)
      command(str).execute(args, bitmap)
    else
      invalid_command
    end
  end

  def invalid_command
    puts 'Invalied command'
  end

  def command(str)
    Parser.commands[str]
  end
end
