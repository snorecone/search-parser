module SearchParser
  class Term
    attr_reader :term
    
    def initialize(term)
      @term = term
    end
    
    def to_s
      term.inspect
    end
  end
end