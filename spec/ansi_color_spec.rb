require File.dirname(__FILE__) + '/spec_helper'

describe AnsiColor do
  describe "wrapping strings" do

    it "returns the original string with no options" do
      tag = ansi_tag('james')
      tag.should == 'james'
    end

    it "red and bold" do
      tag = ansi_tag('james', :color => :red, :effects => :bold)
      tag.should == "#{Helpers::E}31;1mjames#{Helpers::E}0m"
    end

    it "blue on white blinking" do
      tag = ansi_tag('james', :color => :blue,
        :background => :white,
        :effects => :blink)
      tag.should == "#{Helpers::E}34;47;5mjames#{Helpers::E}0m"
    end

  end
end

# describe String do
# 
#   describe "styles" do
# 
#     Helpers::EFFECTS.each do |name, code|
#       it "#{name}" do
#         "test string".send(name).should == "#{Helpers::E}#{code}mtest string#{Helpers::RESET}"
#         # puts "#{name}".send(name)
#       end
#     end
# 
#   end
# 
#   describe "foreground colours" do
# 
#     Helpers::FOREGROUND_COLOURS.each do |name, code|
#       it "#{name}" do
#         "test string".send(name).should == "#{Helpers::E}#{code}mtest string#{Helpers::RESET}"
#         # puts "#{name}".send(name)
#       end
#     end
# 
#   end
# 
#   describe "background colours" do
# 
#     Helpers::BACKGROUND_COLOURS.each do |name, code|
#       it "#{name}" do
#         "test string".send("#{name}_background").should == "#{Helpers::E}0;#{code}mtest string#{Helpers::RESET}"
#         # puts "#{name}_background".send("#{name}_background")
#       end
#     end
# 
#   end
# 
#   describe "colour on background" do
# 
#     Helpers::FOREGROUND_COLOURS.each do |fg_name, fg_code|
#       Helpers::BACKGROUND_COLOURS.each do |bg_name, bg_code|
#         it "#{fg_name} on #{bg_name}" do
#           "test string".send("#{fg_name}_on_#{bg_name}").should == "#{Helpers::E}#{fg_code};#{bg_code}mtest string#{Helpers::RESET}"
#           # puts "#{fg_name}_on_#{bg_name}".send("#{fg_name}_on_#{bg_name}")
#         end
#       end
#     end
# 
#   end
# 
# end