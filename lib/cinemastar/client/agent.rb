require 'open-uri'
require 'pit'

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
        { host: config('cinemastar_host'),
          user: config('cinemastar_user'),
          pass: config('cinemastar_pass')
        }
      end

      def config(val)
        ENV[val] || pit(val)
      end

      def pit(val)
        @pit ||= Pit.get("cinemastar", :require => {
          "cinemastar_host" => "path.to.host",
          "cinemastar_user" => "Cinemastar User",
          "cinemastar_pass" => "Cinemastar Pass"
        })
        @pit[val]
      end

      def read(path)
        open(path, {:http_basic_authentication => [@config[:user], @config[:pass]]}).read
      end
  end
end
