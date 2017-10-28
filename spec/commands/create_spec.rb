# encoding: utf-8

require 'parser'

describe Commands::Create do
  let(:bitmap) { nil }
  let(:args) { %w[2 2] }

  describe '#parse' do
    it 'outputs invalied command message' do
      args = []
      expect { described_class.execute(args, bitmap) }
        .to raise_error(StandardError, 'Bitmap coordinates are out of limits')
    end

    it 'return bitmap' do
      expect(described_class.execute(args, bitmap)).to an_instance_of(Bitmap)
    end
  end
end
