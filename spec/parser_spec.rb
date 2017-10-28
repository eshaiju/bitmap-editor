# encoding: utf-8

require 'parser'

describe Parser do
  let(:bitmap) { nil }
  describe '#parse' do
    it 'outputs invalied command message' do
      command_string = 'M 1 1'
      message = "Invalied command\n"
      expect { subject.parse(command_string, bitmap) }
        .to output(message).to_stdout
    end

    it 'excecute show commad' do
      command_string = 'S'
      expect(Commands::Show).to receive(:execute)
      subject.parse(command_string, bitmap)
    end

    it 'excecute create commad' do
      command_string = 'I'
      expect(Commands::Create).to receive(:execute)
      subject.parse(command_string, bitmap)
    end

    it 'excecute clear commad' do
      command_string = 'C'
      expect(Commands::Clear).to receive(:execute)
      subject.parse(command_string, bitmap)
    end

    it 'excecute color commad' do
      command_string = 'L'
      expect(Commands::Color).to receive(:execute)
      subject.parse(command_string, bitmap)
    end

    it 'excecute vertical_line commad' do
      command_string = 'V'
      expect(Commands::VerticalLine).to receive(:execute)
      subject.parse(command_string, bitmap)
    end

    it 'excecute horizontal_line commad' do
      command_string = 'H'
      expect(Commands::HorizontalLine).to receive(:execute)
      subject.parse(command_string, bitmap)
    end
  end
end
