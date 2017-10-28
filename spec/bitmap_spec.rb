require 'bitmap'

describe Bitmap do
  describe "#create_bitmap" do
    context "invalied coordinates" do
      it 'raises error if width is less than 1' do
        expect{ Bitmap.new('0', '10') }.to raise_error(StandardError, 'Bitmap coordinates are out of limits')
      end

      it 'raises error if width is greater than 250' do
        expect{ Bitmap.new('0', '10') }.to raise_error(StandardError, 'Bitmap coordinates are out of limits')
      end

      it 'raises error if height is less than 1' do
        expect{ Bitmap.new('11', '0') }.to raise_error(StandardError, 'Bitmap coordinates are out of limits')
      end

      it 'raises error if height is greater than 250' do
        expect{ Bitmap.new('33', '251') }.to raise_error(StandardError, 'Bitmap coordinates are out of limits')
      end
    end

    context "valied coordinates" do
      it 'create bitmap array' do
        expect(Bitmap.new(2, 2).matrix).to match_array [['O', 'O'], ['O', 'O']]
      end
    end
  end
end
