class FixedParams
  class << self
    def money(value)
      return if value.nil?
      if value.is_a?(Numeric)
        value
      else
        value.delete!('R$')
        if value.include?(',')
          value.delete!('.')
          value.tr!(',', '.')
        end

        value.squish!
        value.to_d
      end
    end
  end
end
