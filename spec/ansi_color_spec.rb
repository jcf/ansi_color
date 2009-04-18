require File.dirname(__FILE__) + '/spec_helper'

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