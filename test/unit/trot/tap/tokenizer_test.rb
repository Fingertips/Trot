require File.expand_path('../../../../start', __FILE__)

describe "Trot::Tap::Tokenizer" do
  before do
    @stream    = Trot::Tap::Stream.new
    @tokenizer = Trot::Tap::Tokenizer.new(@stream)
  end
  
  it "tokenizes version" do
    @tokenizer.parse('TAP version 13')
    @stream.version.should == 13
  end
end