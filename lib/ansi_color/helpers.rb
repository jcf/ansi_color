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

      options.merge!(args)

      fg = code_from_name(options[:color]) unless options[:color].nil?
      bg = code_from_background_name(options[:background]) unless options[:background].nil?

      # options.reject! { |key, value| key == :color || key == :background }

      if effects = options[:effects]
        effects = Array(effects).flatten
        if (effects - EFFECTS.keys).empty?
          effects = Effects.new(effects).to_codes!
        else
          raise InvalidEffect, "The only valid effects are #{EFFECTS.keys.join(', ')}"
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