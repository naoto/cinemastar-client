require 'open-uri'

module Cinemastar::Client
  class Agent

    def initialize
      @config = load_config
    end

    def get(path, val = {})
      params = val.to_a.map { |v| "#{v.first}=#{v.last}" }.join("&")
      site = "http://#{@config[:host]}/#{path}"
      Video.load_json("http://#{@config[:host]}", read("#{site}?#{params}"))
    end

    private
      def load_config
        { host: ENV['cinemastar_host'],
          user: ENV['cinemastar_user'],
          pass: ENV['cinemastar_pass']
        }
      end

      def read(path)
        open(path, {:http_basic_authentication => [@config[:user], @config[:pass]]}).read
      end
  end
end
