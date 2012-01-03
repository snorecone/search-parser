module SearchParser
  class Transform < Parslet::Transform
    rule(:term => simple(:t)) { Term.new(t) }
    rule(:pair => subtree(:t)) { Property.new(t[:key].to_s, t[:value].to_s, t[:negator]) }
  end
end
