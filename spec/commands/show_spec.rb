require 'parser'

describe Commands::Show do
  let(:bitmap) { nil}
  let(:args) {}

  describe "#parse" do
    it 'outputs invalied command message' do
      message = "No bitmap has been created\n"
      expect { described_class.execute(args, bitmap) } .to output(message).to_stdout
    end

    it 'prints bitmap' do
      bitmap = [['O','O'],['O','Z']]
      expect { described_class.execute(args, bitmap) } .to output("OO\nOZ\n").to_stdout
    end
  end
end
