require 'json'

module Cinemastar::Client
  class Video

    attr_reader :title, :path

    def self.load_json(site, str)
      JSON.parse(str).map! { |f|
        Video.new(site, f["title"], f["path"])
      }
    end

    def initialize(site, title, path)
      @title = title
      @path = "#{site}#{path}"
    end

  end
end
