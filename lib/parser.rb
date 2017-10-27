require './lib/commands/show'
require './lib/commands/create'

class Parser
  attr_reader :bitmap

  def self.commands
    {
      "S" => Commands::Show,
      "I" => Commands::Create
    }
  end

  def parse(command_string, bitmap)
    args = command_string.split
    str = args.shift
    Parser.commands.has_key?(str) ? command(str).execute(args, bitmap) : invalid_command
  end

  def invalid_command
    puts 'Invalied command'
  end

  def command(str)
    Parser.commands[str]
  end
end
