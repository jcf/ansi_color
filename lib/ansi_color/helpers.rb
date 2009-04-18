module AnsiColor
  class Helpers
    def self.code_from_name(name)
      FOREGROUND_COLOURS[name] || raise(InvalidColorName, "#{name} is not a colour")
    end

    def self.name_from_code(code)
      FOREGROUND_COLOURS.index(code.to_i) || raise(InvalidColorCode, "#{code} is not a colour code")
    end

    def self.code_from_background_name(name)
      BACKGROUND_COLOURS[name] || raise(InvalidColorName, "#{name} is not a background colour")
    end

    def self.name_from_background_code(code)
      BACKGROUND_COLOURS.index(code.to_i) || raise(InvalidColorCode, "#{code} is not a background colour code")
    end

    def self.build_open_tag(args={})
      # X;FG;BG;Bm
      return if args.size == 0
      options = {
        :color => nil,
        :background => nil,
        :effects => nil
      }

      args.each do |k, v|
        unless options.keys.include?(k)
          valid_options = options.keys.join(', ')
          raise ArgumentError, "#{k} is not a valid argument. Valid options are #{valid_options}"
        end
      end

      fg, bg = options[:color], options[:background]
      options.merge!(args)

      fg = code_from_name(options[:color]) unless options[:color].nil?
      bg = code_from_background_name(options[:background]) unless options[:background].nil?

      # options.reject! { |key, value| key == :color || key == :background }

      unless options[:effects].nil?
        if options[:effects].class == Symbol
          raise InvalidEffect, "#{options[:effects]} is not a valid effect" unless EFFECTS.include?(options[:effects])
          effects = EFFECTS[options[:effects]]
        elsif options[:effects].class == Array
          effects = Effects.new(options[:effects]).to_codes!
        else
          raise ArgumentError, "when specifying an effect you need to use either a Symbol or an Array of effects"
        end
      end

      tag = [fg || 0, bg, effects].compact.join(';')
      "#{E + tag}m"
    end

    def self.reset
      RESET
    end
  end
end