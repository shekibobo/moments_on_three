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
      attachment.instance.extract(file)

      # you return a file handle which is the processed result
      dst = file
    end
  end
end
