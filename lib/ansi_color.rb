$:.push File.dirname(__FILE__)
require "ansi_color/helpers"
require "ansi_color/effects"
require "ansi_color/string"
require "ansi_color/rainbow"

module AnsiColor
  class InvalidColorName < StandardError; end
  class InvalidColorCode < StandardError; end
  class InvalidEffect < StandardError; end

  E = "\033["
  RESET = "#{E}0m"
  EFFECTS = {
    :normal     => 0,
    :bold       => 1,
    :underscore => 4,
    :blink      => 5,
    :inverse    => 7
  }
  FOREGROUND_COLOURS = {
    :black   => 30,
    :red     => 31,
    :green   => 32,
    :yellow  => 33,
    :blue    => 34,
    :magenta => 35,
    :cyan    => 36,
    :white   => 37
  }
  BACKGROUND_COLOURS = {
    :black   => 40,
    :red     => 41,
    :green   => 42,
    :yellow  => 43,
    :blue    => 44,
    :magenta => 45,
    :cyan    => 46,
    :white   => 47
  }

  FOREGROUND_COLOURS.each do |name, code|
    define_method(name) { code }
  end

  BACKGROUND_COLOURS.each do |name, code|
    define_method("#{name}_background") { code }
  end

  def ansi_tag(string, options={})
    return string if options.empty?
    open_tag = Helpers::build_open_tag(options)
    open_tag + string + Helpers::reset
  end
end