module ApplicationHelper
  def edit_button_for(arr, options={})
    link_to button(:edit, options[:alt]), [ :edit ] + arr
  end

  def delete_button_for(arr, options={})
    options[:confirm] ||= "Are you sure?"
    link_to button(:delete, options[:alt]), arr,
      :confirm => options[:confirm],
      :method => :delete
  end
  alias destroy_button_for delete_button_for

  def like_button_for(arr, options={})
    link_to button(:thumb_up, options[:alt]), ""
  end

  def new_button_for(arr, options={})
    link_to button(:add, options[:alt]), [:new] + arr
  end

  def button(type, alt="")
    image_tag "icons/#{type.to_s}.png", :class => 'button', :alt => alt
  end

  def add_cart_button_for(arr, attr_hash={})
    link_to button(:cart_add), polymorphic_url( [:new] + arr, attr_hash )
  end

  def remove_cart_button_for(arr, options={})
    link_to button(:cart_delete), arr,
      :confirm => options[:confirm], :method => :delete
  end
end
