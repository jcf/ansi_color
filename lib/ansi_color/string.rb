module AnsiColor
  module String
    FOREGROUND_COLORS.each do |name, code|
      define_method name do
        "#{E}#{code}m#{self}#{RESET}"
      end
    end

    BACKGROUND_COLORS.each do |name, code|
      define_method "#{name}_background" do
        "#{E}0;#{code}m#{self}#{RESET}"
      end
    end

    FOREGROUND_COLORS.each do |fg_name, fg_code|
      BACKGROUND_COLORS.each do |bg_name, bg_code|
        define_method "#{fg_name}_on_#{bg_name}" do
          "#{E}#{fg_code};#{bg_code}m#{self}#{RESET}"
        end
      end
    end

    EFFECTS.each do |name, code|
      define_method name do
        "#{E}#{code}m#{self}#{E}0m"
      end
    end
  end
end