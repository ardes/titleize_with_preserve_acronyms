require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe "Inflector#titleize" do
  it '"hello there" => "Hello There"' do
    "hello there".titleize.should == "Hello There"
  end
  
  it '"ResourcesController" => "Resources Controller"' do
    "ResourcesController".titleize.should == "Resources Controller"
  end
  
  it '"i want my UB40" => "I Want My UB40"' do
    "i want my UB40".titleize.should == "I Want My UB40"
  end
  
  it '"pantene ProV" => "Pantene Pro V"' do
    "pantene ProV".titleize.should == 'Pantene Pro V'
  end
  
  it '"my UB40SUX thing" => "My UB40SUX Thing"' do
    "my UB40SUX thing".titleize.should == "My UB40SUX Thing"
  end

  it '"20KK my UB40SUX thing UB40SUX UB40SUX" => "20KK My UB40SUX Thing UB40SUX UB40SUX"' do
    "20KK my UB40SUX thing UB40SUX UB40SUX".titleize.should == "20KK My UB40SUX Thing UB40SUX UB40SUX"
  end
end