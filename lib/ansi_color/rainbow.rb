module Color
  class Rainbow
    def initialize
      puts "\n\n== build_open_tag FOREGROUND"
      FOREGROUND_COLOURS.each do |fg_name, fg_code|
        open = Helpers::build_open_tag(:color => fg_name)
        print "#{open}#{fg_name}#{Helpers::reset}\n"
      end

      puts "\n\n== build_open_tag BACKGROUND"
      BACKGROUND_COLOURS.each do |bg_name, bg_code|
        open = Helpers::build_open_tag(:background => bg_name)
        print "#{open}#{bg_name}#{Helpers::reset}\n"
      end

      puts "\n\n== build_open_tag FOREGROUND, BACKGROUND & EFFECT"
      FOREGROUND_COLOURS.each do |fg_name, fg_code|
        BACKGROUND_COLOURS.each do |bg_name, bg_code|
          open = Helpers::build_open_tag(:color => fg_name, :background => bg_name)
          print "#{open}#{fg_name} #{bg_name}#{Helpers::reset}\n"
          EFFECTS.each do |effect_name, effect_code|
            open = Helpers::build_open_tag(:color => fg_name, :background => bg_name, :effects => effect_name)
            print "#{open}#{fg_name} #{bg_name} #{effect_name}#{Helpers::reset}\n"
          end
          print "\n"
        end
      end
    end
  end
end