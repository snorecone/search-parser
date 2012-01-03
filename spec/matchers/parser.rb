class SearchParser::Parser::Matcher
  def initialize(query)
    @query = query
  end
  
  def description
    "be valid when parsing #{@query}"
  end
  
  def failure_message
    "expected parser to parse #{@query} but did not. #{@error.inspect}"
  end
  
  def negative_failure_message
    "expected parser not to parse #{@query} but it did"
  end
  
  def matches?(subject)
    result = subject.parse(@query)

    rescue Parslet::ParseFailed => e
      @error = [e, subject.error_tree]
      false
  end
  
  def does_not_match?(subject)
    result = subject.parse(@query)
    
    rescue Parslet::ParseFailed
      true
    else
      false
  end
end