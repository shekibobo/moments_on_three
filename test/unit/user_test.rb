require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "admin permissions on a gallery" do
    def setup
      @gallery = galleries(:senior_gallery)
      @admin = users(:admin)
    end

    test "admin can interact and modify a gallery" do
      assert @admin.can_share? @gallery
      assert @admin.can_view? @gallery
      assert @admin.can_vote? @gallery
      assert @admin.can_purchase? @gallery
      assert @admin.can_modify? @gallery
    end

  end

  context "owner permissions on a gallery" do
    def setup
      @gallery = galleries(:senior_gallery)
      @owner = @gallery.owner
    end

    test "gallery owner interact with their gallery" do
      assert @owner.can_share? @gallery
      assert @owner.can_view? @gallery
      assert @owner.can_purchase? @gallery
      assert @owner.can_modify? @gallery
      assert @owner.can_vote? @gallery
    end
  end

  context "random user permissions on a gallery" do
    def setup
      @gallery = galleries(:senior_gallery)
      @user = users(:david)
    end

    test "random user can't do anything to a gallery" do
      assert !@user.can_share?(@gallery)
      assert !@user.can_view?(@gallery)
      assert !@user.can_vote?(@gallery)
      assert !@user.can_modify?(@gallery)
      assert !@user.can_purchase?(@gallery)
    end

  end

  context "user with permissions on a gallery" do
    def setup
      @gallery = galleries(:senior_gallery)
      @user = users(:andrew)
    end

    test "user with share permissions can interact with a gallery" do
      assert @user.can_share? @gallery
      assert @user.can_view? @gallery
      assert @user.can_purchase? @gallery
      assert @user.can_vote? @gallery
    end

    test "user with normal permissions cannot otherwise modify the gallery" do
      assert !@user.can_modify?(@gallery)
    end
  end
end
