require 'json'

module Cinemastar::Client
  class Video

    attr_reader :title, :path, :thumbnail

    def self.load_json(site, str)
      JSON.parse(str).map! { |f|
        Video.new(site, f["title"], f["path"], f["thumbnail"])
      }
    end

    def initialize(site, title, path, thumbnail)
      @title = title
      @path = "#{site}#{path}"
      @thumbnail = "#{site}/thumbnail/#{thumbnail}"
    end

    def category
      File.dirname(@path).gsub(/^.+\//, '')
    end

  end
end
