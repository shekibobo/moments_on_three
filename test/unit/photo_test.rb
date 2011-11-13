require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  def setup
    @photo = photos(:senior_photo_one)
    set_sample_image
  end

  test "photo name is humanized file name" do
    assert @photo.name == "Sample file"
  end

  test "photo category is the same as it's directory" do
    assert @photo.category == @photo.gallery.category
  end

  test "sample photo is landscape" do
    set_sample_image("sample_landscape_image.jpg")
    assert @photo.orientation == 'landscape'
  end

  test "sample photo is portrait" do
    set_sample_image("sample_portrait_image.jpg")
    assert @photo.orientation == 'portrait'
  end

  def set_sample_image(filename="sample_file.jpg")
    @image = sample_file(filename)
    @photo.image = @image
    @photo.save
  end
end
