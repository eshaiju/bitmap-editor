# encoding: utf-8

require 'parser'

describe Commands::FloodFill do
  let(:bitmap) { Bitmap.new(2, 2) }
  let(:args) { %w[2 2 C] }
  let(:no_bitmap_message) { "No bitmap found\n" }

  describe '#execute' do
    context 'bitmap empty' do
      it 'outputs invalied command message' do
        bitmap = nil
        expect { described_class.execute(args, bitmap) }
          .to output(no_bitmap_message).to_stdout
      end
    end

    context 'invalied coordinates' do
      it 'raises error if width is less than 1' do
        args = %w[0 2 C]
        error_message = "Coordinates 0, 2 doesn't exist in bitmap"
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, error_message)
      end

      it 'raises error if width is greater than limit' do
        args = %w[3 2 C]
        error_message = "Coordinates 3, 2 doesn't exist in bitmap"
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, error_message)
      end

      it 'raises error if height is less than 1' do
        args = %w[2 0 C]
        error_message = "Coordinates 2, 0 doesn't exist in bitmap"
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, error_message)
      end

      it 'raises error if height is greater than limit' do
        args = %w[2 3 C]
        error_message = "Coordinates 2, 3 doesn't exist in bitmap"
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, error_message)
      end

      it 'raises error if color is not provided in argument' do
        args = %w[2 1]
        error_message = 'Color not provided'
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, error_message)
      end
    end

    context 'valied input' do
      it 'return bitmap' do
        expect(described_class.execute(args, bitmap))
          .to an_instance_of(Bitmap)
      end

      it 'return bitmap with colored matrix' do
        expect(described_class.execute(args, bitmap).matrix)
          .to eq [%w[C C], %w[C C]]
      end
    end
  end
end
