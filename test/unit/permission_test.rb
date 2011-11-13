require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  test "new permission is valid" do
    assert Permission.new.valid?
  end

  context "permission relationships" do
    def setup
      @permission = permissions(:owen_senior_gallery_permissions)
    end

    test "permissions define a shared gallery" do
      assert_not_nil @permission.shared_gallery
    end

    test "permissions define a shared user" do
      assert_not_nil @permission.shared_user
    end
  end
end
