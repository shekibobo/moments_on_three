require 'test_helper'

class PrintTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Print.new.valid?
  end
end
