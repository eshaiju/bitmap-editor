# encoding: utf-8

require 'bitmap_editor'

describe BitmapEditor do
  describe '#run' do
    context 'incorrect file' do
      it 'raise error' do
        expect { subject.run('./sample.txt') } .to raise_error(StandardError)
      end
    end
  end
end
