module Color
  class Effects < Array
    def initialize(array)
      array = array.select { |effect| EFFECTS.include?(effect) }
      super(array)
    end
    def to_codes!
      self.map! { |code| Color::EFFECTS[code] }.join(';')
    end
  end
end