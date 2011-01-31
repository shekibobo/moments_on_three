module Paperclip
  class Extractor < Processor
    attr_accessor :resolution, :whiny
    def initialize(file, options = {}, attachment = nil)
      super
      @file = file
      @whiny = options[:whiny].nil? ? true : options[:whiny]
      @basename = File.basename(@file.path, File.extname(@file.path))
      @attachment = attachment
      @instance = attachment.instance
    end
    def make
      # do your conversions here, you've got @file, @attachment and @basename to work with
      export_path = attachment.path.gsub('.zip', '_content')

      Zip::ZipFile.open(file) { |zip_file|
        zip_file.each { |image|
          image_path = File.join(export_path, image.name)
          FileUtils.mkdir_p(File.dirname(image_path))
          unless File.exist?(image_path)
            zip_file.extract(image, image_path)
            photo = attachment.instance.photos.build
            photo.image = File.open(image_path)
            # photo.name = photo.image.original_filename.gsub(/\..*/, '')
            # photo.tag_list = [ Category.find(category_id).name ]
            photo.save
          end
        }
      }
      # clean up source files, but leave the zip
      FileUtils.remove_dir(export_path)

      # you return a file handle which is the processed result
      dst = File.open attachment.path
    end
  end
end
