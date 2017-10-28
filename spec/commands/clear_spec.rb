# encoding: utf-8

require 'parser'

describe Commands::Clear do
  let(:bitmap) { Bitmap.new(2, 2) }
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

    it 'return bitmap' do
      expect(described_class.execute(args, bitmap))
        .to an_instance_of(Bitmap)
    end

    it 'return bitmap with colored matrix' do
      bitmap.set_matrix_color(1, 1, 'C')
      expect(described_class.execute(args, bitmap).matrix)
        .to eq [%w[O O], %w[O O]]
    end
  end
end
