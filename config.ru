require "rubygems"
require "bundler"
Bundler.require

$:.unshift File.dirname(__FILE__)
require "ruby_shift"

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'foo'
end

run RubyShift
