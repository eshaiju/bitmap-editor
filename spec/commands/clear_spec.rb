# encoding: utf-8

require 'parser'

describe Commands::Clear do
  let(:bitmap) { Bitmap.new(2, 2) }
  let(:args) { nil }

  describe '#parse' do
    it 'outputs invalied command message' do
      bitmap = nil
      message = "No bitmap found\n"
      expect { described_class.execute(args, bitmap) }
        .to output(message).to_stdout
    end

    it 'return bitmap' do
      expect(described_class.execute(args, bitmap))
        .to an_instance_of(Bitmap)
    end

    it 'return bitmap with colored matrix' do
      bitmap.set_matrix_colour(1, 1, 'C')
      expect(described_class.execute(args, bitmap).matrix)
        .to eq [%w[O O], %w[O O]]
    end
  end
end
