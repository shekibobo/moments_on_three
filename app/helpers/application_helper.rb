module ApplicationHelper
  def edit_button_for(*object)
    if object.size == 1
      link_to button(:edit), [ :edit, object[0] ]
    else
      link_to button(:edit), [ :edit, object[0], object[1] ]
    end
  end

  def delete_button_for(*object, options)
    options[:confirm] ||= "Are you sure?"
    if object.size == 1
      link_to button(:delete), [ object[0] ],
        :confirm => options[:confirm], :method => :delete
    else
      link_to button(:delete), [ object[0], object[1] ],
        :confirm => options[:confirm], :method => :delete
    end
  end

  def like_button_for(*object)
    link_to button(:thumb_up), ""
  end

  def button(type)
    image_tag "icons/#{type.to_s}.png", :class => 'button'
  end
end
