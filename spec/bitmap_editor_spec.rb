require 'bitmap_editor'

describe BitmapEditor do

  describe "#run" do
    it 'return error message when file not exist' do
       expect(STDOUT).to receive(:puts).with('Please provide correct file')
       subject.run('')
    end
  end
end
