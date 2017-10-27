require 'bitmap_editor'

describe BitmapEditor do
  describe "#run" do
    context 'incorrect file' do
     it 'raise error' do
       expect { subject.run('./test.txt') } .to  raise_error(StandardError)
     end
   end
  end
end
