require 'uri'

module Cinemastar::Client
  class API

    def self.find(target, page = 1)
      Agent.new.get("search/#{page}.json", {"query" => URI.encode(target)})
    end

    def self.category(path)
      Agent.new.get(URI.encode("category/#{path}.json"))
    end

    def self.latest
      Agent.new.get("latest")
    end

    def self.title(target, page = 1)
      Agent.new.get("title/#{page}.json", {"query" => URI.encode(target)})
    end

  end
end
