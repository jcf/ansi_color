module Color
  class Effects < Array
    def initialize(array)
      array.reject { |effect| ! EFFECTS.include?(effect) }
      super
    end
    def to_codes!
      self.map! { |code| Color::EFFECTS[code] }.join(';')
    end
  end
end