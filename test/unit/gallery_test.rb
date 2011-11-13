require 'test_helper'

class GalleryTest < ActiveSupport::TestCase
  test "new gallery should be valid" do
    assert Gallery.new.valid?
  end
end
