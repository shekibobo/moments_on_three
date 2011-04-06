module ApplicationHelper
  def edit_button_for(*object)
    link_to button(:edit), [ :edit ] + object
  end

  def delete_button_for(*object, options)
    link_to button(:delete), object,
      :confirm => options[:confirm], :method => :delete
  end

  def like_button_for(*object)
    link_to button(:thumb_up), ""
  end

  def new_button_for
  end

  def button(type)
    image_tag "icons/#{type.to_s}.png", :class => 'button'
  end
end
