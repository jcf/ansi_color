require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Effects do

  it "ignores invalid effects on initialize" do
    effects = [:bold, :blink, :does_not_exist]
    effects = Effects.new(effects)
    effects.should == [:bold, :blink]
  end

  it "converts an array of effects to codes" do
    effects = [:bold, :blink]
    effects = Effects.new(effects)
    effects.to_codes!.should == "#{EFFECTS[:bold]};#{EFFECTS[:blink]}"
  end

end