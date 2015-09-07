require 'json'
require 'time'

module Cinemastar::Client
  class Video

    attr_reader :title, :path, :thumbnail, :update_at

    def self.load_json(site, str)
      JSON.parse(str).map! { |f|
        Video.new(site, f["title"], f["path"], f["thumbnail"], f["update_at"]) unless f["update_at"].nil?
      }
    end

    def initialize(site, title, path, thumbnail, update_at)
      @title = title
      @path = "#{site}#{path}"
      @thumbnail = "#{site}/thumbnail/#{thumbnail}"
      @update_at = Time.parse(update_at)
    end

    def category
      File.dirname(@path).gsub(/^.+\//, '')
    end

  end
end
