# encoding: utf-8

require 'parser'

describe Commands::Show do
  let(:bitmap) { nil }
  let(:args) { nil }
  let(:no_bitmap_message) { "No bitmap found\n" }

  describe '#execute' do
    context 'bitmap empty' do
      it 'outputs invalied command message' do
        bitmap = nil
        expect { described_class.execute(args, bitmap) }
          .to output(no_bitmap_message).to_stdout
      end
    end

    it 'prints bitmap' do
      bitmap = Bitmap.new(2, 2)
      expect { described_class.execute(args, bitmap) }
        .to output("OO\nOO\n").to_stdout
    end
  end
end
