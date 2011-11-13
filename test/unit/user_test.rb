require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  context "sharing" do
    test "gallery owner can share a gallery" do
      @gallery = galleries(:senior_gallery)
      @owner = @gallery.owner
      assert @owner.can_share? @gallery
    end

    test "admin can share a gallery" do
      @gallery = galleries(:senior_gallery)
      @admin = users(:admin)
      assert @admin.can_share? @gallery
    end

    test "random user can't share a gallery" do
      @gallery = galleries(:senior_gallery)
      @user = users(:owen)
      assert !@user.can_share?(@gallery)
    end

    test "user with share permissions can share a gallery" do
      @gallery = galleries(:senior_gallery)
      @user = users(:andrew)
      assert @user.can_share? @gallery
    end
  end

end
