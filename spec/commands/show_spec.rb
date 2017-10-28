# encoding: utf-8

require 'parser'

describe Commands::Show do
  let(:bitmap) { nil }
  let(:args) { nil }

  describe '#parse' do
    it 'outputs invalied command message' do
      message = "No bitmap has been created\n"
      expect { described_class.execute(args, bitmap) }
        .to output(message).to_stdout
    end

    it 'prints bitmap' do
      bitmap = Bitmap.new(2, 2)
      expect { described_class.execute(args, bitmap) }
        .to output("OO\nOO\n").to_stdout
    end
  end
end
