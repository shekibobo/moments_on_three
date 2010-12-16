# get the photo's gallery name as part of the path/url
Paperclip.interpolates :gallery do |attachment, style|
  attachment.instance.gallery.title
end