# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= "test"
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'spec'
require "active_support"
require "titleize_with_preserve_acronyms"

Spec::Runner.configure do |config|
  
end