require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class String
  include AnsiColor::String
end

describe String do
  describe "styles" do
    EFFECTS.each do |name, code|
      it "#{name}" do
        "test string".send(name).should == "#{E}#{code}mtest string#{RESET}"
      end
    end
  end

  describe "foreground colors" do
    FOREGROUND_COLORS.each do |name, code|
      it "#{name}" do
        "test string".send(name).should == "#{E}#{code}mtest string#{RESET}"
      end
    end
  end

  describe "background colors" do
    BACKGROUND_COLORS.each do |name, code|
      it "#{name}" do
        "test string".send("#{name}_background").should == "#{E}0;#{code}mtest string#{RESET}"
      end
    end
  end

  describe "color on background" do
    FOREGROUND_COLORS.each do |fg_name, fg_code|
      BACKGROUND_COLORS.each do |bg_name, bg_code|
        it "#{fg_name} on #{bg_name}" do
          "test string".send("#{fg_name}_on_#{bg_name}").should == "#{E}#{fg_code};#{bg_code}mtest string#{RESET}"
        end
      end
    end
  end
end