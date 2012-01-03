module SearchParser
  class Property
    attr_reader :key, :values
    
    def initialize(key, values, negation=false)
      @key = key
      @values = values
      @negated = !!negation
    end
    
    def negated?
      @negated
    end
  end
end