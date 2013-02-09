require 'test_helper'
require 'rails/performance_test_help'

class BrowsingTest < ActionDispatch::PerformanceTest
 # include Devise::TestHelpers
  # Refer to the documentation for all available options
   self.profile_options = { :runs => 1000, :metrics => [:wall_time, :memory],:output => 'tmp/performance', :formats => [:flat] }

  def setup

  end

  def test_homepage
    get '/'
  end
end
