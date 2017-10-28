# encoding: utf-8

require 'bitmap_editor'

describe BitmapEditor do
  describe '#run' do
    context 'incorrect file' do
      it 'raise error' do
        expect { subject.run('./sample.txt') } .to raise_error(StandardError)
      end
    end

    context 'correct file' do
      let(:output) { `bin/bitmap_editor ./examples/show.txt` }
      it 'shows an M x N final bitmap' do
        expect(output).to eq(<<~EOS
          OOOOO
          OOZZZ
          AWOOO
          OWOOO
          OWOOO
          OWOOO
        EOS
                            )
      end
    end
  end
end
