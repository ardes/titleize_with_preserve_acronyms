require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe "Inflector#titleize" do
  describe "(with no extra config)" do
    it '"hello there" => "Hello There"' do
      "hello there".titleize.should == "Hello There"
    end
  
    it '"ResourcesController" => "Resources Controller"' do
      "ResourcesController".titleize.should == "Resources Controller"
    end
  
    it '"i want my UB40" => "I Want My Ub40"' do
      "i want my UB40".titleize.should == "I Want My Ub40"
    end
  end
  
  describe "(with titleize_preserve_acronyms = true)" do
    before do
      @previous_titleize_preserve_acronyms = ActiveSupport::Inflector.inflections.titleize_preserve_acronyms
      ActiveSupport::Inflector.inflections.titleize_preserve_acronyms = true
    end
    
    after do
      ActiveSupport::Inflector.inflections.titleize_preserve_acronyms = @previous_titleize_preserve_acronyms
    end
      
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
  
  describe "(with titleize_exception 'NuVu')" do
    before do
      ActiveSupport::Inflector.inflections.titleize_exception 'NuVu'
    end
    
    it '"the NuVu ThinGo" => "the NuVu Thin Go"' do
      "the NuVu ThinGo".titleize.should == "The NuVu Thin Go"
    end
  end
end