require File.expand_path('../../../spec/spec_helper', __FILE__)

describe SearchParser::Transform  do
  let(:transform) { SearchParser::Transform.new }
  
  it "must transform a term" do
    tree = {:term => "potato"}
    transform.apply(tree).must_be_instance_of SearchParser::Term
  end
  
  it "must transform a pair" do
    tree = {:pair => { :key => 'hello', :value => 'kitty'}}
    transform.apply(tree).must_be_instance_of SearchParser::Property
  end
  
  it "must transform both pairs and terms" do
    tree = [{:pair => { :key => 'hello', :value => 'kitty'}}, {:term => 'potato'}, {:term => 'ghetto'}]
    transformed = transform.apply(tree)
    transformed.size.must_equal 3
    transformed.each do |leaf|
      [SearchParser::Property, SearchParser::Term].must_include leaf.class
    end
  end
end
