require File.expand_path('../../../spec/spec_helper', __FILE__)

describe SearchParser::Parser  do
  let(:parser) { SearchParser::Parser.new }
  
  def parse(thing)
    SearchParser::Parser::Matcher.new(thing)
  end
  
  describe "key" do
    it "must consume simple" do
      parser.key.must parse("whatup:")
    end
  end
  
  describe "value" do
    it "must consume world" do
      parser.value.must parse("hello")
    end
  end
  
  describe "pair" do
    it "must consume pairs without quotes" do
      parser.pair.must parse('whatup:friend')
    end 
    
    it "must parse pairs with quoted keys" do
      parser.pair.must parse('"whatup":friend')
    end
    
    it "must parse pairs with quoted keys and escaped quotes" do
      parser.pair.must parse('"yee hwa \" helo\" there":friend')
    end
  end
  
  describe "term" do
    it "must consume terms quoted" do
      parser.term.must parse('"yee hwa \" helo\" there"')
    end
    
    it "must consume terms unquoted with no spaces" do
      parser.term.must parse('hellloooo')
    end
    
    it "must not consume terms with spaces" do
      parser.term.wont parse('hellloooo there')
    end
  end
  
  describe "expression" do
    it "must parse a term" do
      parser.expression.must parse('hellloooo')
    end
    
    it "must parse more than one term" do
      parser.expression.must parse('hellloooo therrre')
    end
    
    it "must parse a pair" do
      parser.expression.must parse('"yee hwa \" helo\" there":word')
    end
    
    it "must parse pair and a term" do
      parser.expression.must parse('"yee hwa \" helo\" there":word "here is my term"')
    end
  end
end
