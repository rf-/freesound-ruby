require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Response do
  before do
    @single = File.read("#{Freesound.root_dir}/data/sample.json")
    @multiple = File.read("#{Freesound.root_dir}/data/sample_query.json")
  end

  let(:single) { Response.new(@single) }
  let(:multiple) { Response.new(@multiple) }

  it 'takes a raw hash' do
    Response.new('{"id": 3}', :json).data.should == {:id => 3}
  end

  it 'has sounds' do
    [single, multiple].each do |res|
      res.sounds.should be_a(Array)
      res.sounds.first.should be_a(Sound)
    end
  end

  it 'has number of results' do
    single.num_results.should == 1
    multiple.num_results.should == 12
  end
end
