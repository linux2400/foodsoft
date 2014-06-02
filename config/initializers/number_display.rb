# we'd like to show "0.0" as "0"

class Float
  alias :foodsoft_to_s :to_s
  def to_s
    foodsoft_to_s.chomp(".0")
  end
end

# allow +to_s+ on bigdecimal without argument too
if defined? BigDecimal
  class BigDecimal
    alias :foodsoft_to_s :to_s
    def to_s(format = nil)
      if format.nil?
        foodsoft_to_s(DEFAULT_STRING_FORMAT).chomp(".0")
      else
        foodsoft_to_s(format)
      end
    end
  end
end
