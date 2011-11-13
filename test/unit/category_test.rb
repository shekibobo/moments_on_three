require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "new category should be valid" do
    assert Category.new.valid?
  end
end
