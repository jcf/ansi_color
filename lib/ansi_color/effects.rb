module AnsiColor
  class Effects < Array
    def initialize(array)
      # This should probably be validated
      valid_effects = array.select { |effect| EFFECTS.include?(effect) }
      super(valid_effects)
    end
    def to_codes!
      self.map! { |code| EFFECTS[code] }.join(';')
    end
  end
end