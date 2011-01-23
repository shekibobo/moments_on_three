# get the photo's gallery name as part of the path/url
Paperclip.interpolates :gallery do |attachment, style|
  attachment.instance.gallery.name
end

Paperclip.interpolates :user do |attachment, style|
  attachment.instance.gallery.owner.email.gsub(/@.*/, '')
end