module SearchParser
  class Parser < Parslet::Parser
    rule(:space)       { match('\s').repeat(1) }
    rule(:space?)      { space.maybe }
    rule(:colon)       { str(':') }
    rule(:quote)       { str('"') }
    rule(:negator?)    { str('-').maybe.as(:negator) }
    rule(:escape)      { str("\\") }
  
    # properties
    rule(:quoted_key) {
      quote >> (escape >> quote | quote.absent? >> any).repeat >> quote
    }
  
    rule(:unquoted_key) {
      (space.absent? >> colon.absent? >> any).repeat(1)
    }
    
    rule(:key) { 
      negator? >> space? >> (quoted_key | unquoted_key).as(:key) >> space? >> colon
    }
    
    rule(:value) { (quoted_key | unquoted_key).as(:value) }
    rule(:pair)  { (key >> space? >> value).as(:pair) >> space? }
  
    # terms
    rule(:term) {
      (quoted_key | unquoted_key).as(:term) >> space?
    }
  
    rule(:expression)  { (pair | term).repeat }
    root :expression
  end
end