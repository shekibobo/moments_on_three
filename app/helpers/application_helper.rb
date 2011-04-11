module ApplicationHelper
  def edit_button_for(*object)
    link_to button(:edit), [ :edit ] + object
  end

  def delete_button_for(*object, options)
    link_to button(:delete), object,
      :confirm => options[:confirm], :method => :delete
  end
  alias destroy_button_for delete_button_for

  def like_button_for(*object)
    link_to button(:thumb_up), ""
  end

  def new_button_for
  end

  def button(type)
    image_tag "icons/#{type.to_s}.png", :class => 'button'
  end

  def add_cart_button_for()
    link_to button(:cart_add), ""
  end

  def remove_cart_button_for(*object, options)
    link_to button(:cart_delete), object,
      :confirm => options[:confirm], :method => :delete
  end
end
