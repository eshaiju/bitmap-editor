# encoding: utf-8

require 'parser'

describe Commands::Color do
  let(:bitmap) { Bitmap.new(2, 2) }
  let(:args) { %w[2 2 C] }

  describe '#parse' do
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

      it 'raises error if color is bot provided in argument' do
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

      it 'return bitmap with colord matrix' do
        expect(described_class.execute(args, bitmap).matrix)
          .to eq [%w[O O], %w[O C]]
      end
    end
  end
end
