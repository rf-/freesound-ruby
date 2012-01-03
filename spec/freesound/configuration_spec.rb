require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Configuration do
  subject { Configuration.new(:api_key => 'abc123') }

  specify { subject.api_key == 'abc123' }
end
