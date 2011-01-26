class Permission < ActiveRecord::Base
  attr_accessible :shared_user_id, :shared_gallery_id, :to_view, :to_vote, :to_share, :to_purchase
  belongs_to :shared_user, :class_name => 'User'
  belongs_to :shared_gallery, :class_name => 'Gallery'
end
