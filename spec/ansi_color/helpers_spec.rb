require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Helpers do

  class InvalidColorName < StandardError; end
  class InvalidColorCode < StandardError; end
  class InvalidEffect < StandardError; end

  describe "should build tags" do

    it "color" do
      Helpers::FOREGROUND_COLOURS.each do |name, code|
        Helpers.build_open_tag(:color => name).should == "\e[#{code}m"
      end
    end

    it "background" do
      Helpers::BACKGROUND_COLOURS.each do |name, code|
        Helpers.build_open_tag(:background => name).should == "\e[0;#{code}m"
      end
    end

    it "colour and background" do
      Helpers::FOREGROUND_COLOURS.each do |fg_name, fg_code|
        Helpers::BACKGROUND_COLOURS.each do |bg_name, bg_code|
          Helpers.build_open_tag(:color => fg_name, :background => bg_name).should == "\e[#{fg_code};#{bg_code}m"
        end
      end
    end

    it "takes a symbol as an effect" do
      Helpers.build_open_tag(:effects => :bold).should == "#{Helpers::E}0;0;1m"
    end

    it "takes an array of effects" do
      Helpers.build_open_tag(:effects => [:bold, :blink]).should == "#{Helpers::E}0;0;1;5m"
    end

    describe "handling arguments" do

      it "returns when build_open_tag is called with no args" do
        Helpers.build_open_tag.should be_nil
      end

      it "raises an InvalidEffect when effect is invalid" do
        lambda {
          Helpers.build_open_tag(:effects => :rubbish)
        }.should raise_error(Helpers::InvalidEffect)
      end

    end

  end

  describe "code from name" do

    Helpers::FOREGROUND_COLOURS.each do |name, code|
      it "#{name} returns #{code}" do
        Helpers.send(name).should == code
      end
    end

    Helpers::BACKGROUND_COLOURS.each do |name, code|
      it "#{name}_background returns #{code}" do
        Helpers.send("#{name}_background").should == code
      end
    end
    
  end

  describe "finds colour codes from names" do
    
    Helpers::FOREGROUND_COLOURS.each do |name, code|
      it "code_from_name(:#{name}) returns #{code}" do
        Helpers.code_from_name(name).should == code
      end
    end
    
    Helpers::BACKGROUND_COLOURS.each do |name, code|
      it "code_from_background_name(:#{name}) returns #{code}" do
        Helpers.code_from_background_name(name).should == code
      end
    end
    
  end

  describe "finds colour codes from names" do
    
    Helpers::FOREGROUND_COLOURS.each do |name, code|
      it "name_from_code(#{code}) returns #{name}" do
        Helpers.name_from_code(code).should == name
      end
    end
    
    Helpers::BACKGROUND_COLOURS.each do |name, code|
      it "name_from_background_code(#{code}) returns #{name}" do
        Helpers.name_from_background_code(code).should == name
      end
    end
    
  end

end