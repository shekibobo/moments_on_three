module ApplicationHelper
  def edit_button_for(*object)
    if object.size == 1
      link_to button(:edit), [ :edit, object[0] ]
    else
      link_to button(:edit), [ :edit, object[0], object[1] ]
    end
  end

  def delete_button_for(*object)
    if object.size == 1
      link_to button(:delete), [ object[0] ],
        :confirm => "Are you sure?", :method => :delete
    else
      link_to button(:delete), [ object[0], object[1] ],
        :confirm => "Are you sure?", :method => :delete
    end
  end

  def like_button_for()
    link_to button(:thumb_up), ""
  end

  def button(type)
    image_tag "icons/#{type.to_s}.png", :class => 'button'
  end
end
