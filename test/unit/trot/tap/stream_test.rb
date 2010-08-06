require File.expand_path('../../../../start', __FILE__)

describe "Trot::Tap::Stream" do
  before do
    @stream = Trot::Tap::Stream.new
  end
  
  it "does stuff" do
    @stream.should.be.kind_of?(Trot::Tap::Stream)
  end
end