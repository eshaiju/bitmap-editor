require 'parser'

describe Parser do
  let(:bitmap) { nil}
  describe "#parse" do
    it 'outputs invalied command message' do
      command_string = 'M 1 1'
      message = "Invalied command\n"
      expect { subject.parse(command_string, bitmap) } .to output(message).to_stdout
    end

    it 'excecute show commad' do
      command_string = 'S'
      bitmap = [['O','O'],['O','Z']]
      expect( Commands::Show).to receive(:execute)
      subject.parse(command_string, bitmap)
    end
  end
end
