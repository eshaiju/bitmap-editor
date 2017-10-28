# encoding: utf-8

require 'parser'

describe Commands::VerticalLine do
  let(:bitmap) { Bitmap.new(2, 2) }
  let(:args) { %w[2 1 2 C] }
  let(:out_of_limits_message) { 'Bitmap coordinates are out of limits' }
  let(:no_color_message) { 'Color not provided' }

  describe '#parse' do
    context 'invalied coordinates' do
      it 'raises error if x is less than 1' do
        args = %w[0 1 2 C]
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, out_of_limits_message)
      end

      it 'raises error if x is greater than limit' do
        args = %w[3 1 2 C]
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, out_of_limits_message)
      end

      it 'raises error if y1 is less than 1' do
        args = %w[2 0 2 C]
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, out_of_limits_message)
      end

      it 'raises error if y1 is greater than limit' do
        args = %w[2 3 2 C]
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, out_of_limits_message)
      end

      it 'raises error if y2 is less than 1' do
        args = %w[2 1 0 C]
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, out_of_limits_message)
      end

      it 'raises error if y2 is greater than limit' do
        args = %w[2 2 3 C]
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, out_of_limits_message)
      end

      it 'raises error if color is bot provided in argument' do
        args = %w[2 1 2]
        expect { described_class.execute(args, bitmap) }
          .to raise_error(StandardError, no_color_message)
      end
    end

    context 'valied input' do
      it 'return bitmap' do
        expect(described_class.execute(args, bitmap))
          .to an_instance_of(Bitmap)
      end

      it 'return bitmap with colored matrix' do
        expect(described_class.execute(args, bitmap).matrix)
          .to eq [%w[O C], %w[O C]]
      end
    end
  end
end
