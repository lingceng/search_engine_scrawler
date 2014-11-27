require 'search_engine_scrawler/socket_helper'

module SearchEngineScrawler

  class BaiduScrawler

    def initialize
      @host = 'www.baidu.com'
    end

    def wrap_request(keyword)
      "GET /s?wd=#{keyword} HTTP/1.0\r\n\r\n"
    end

    def fetch_related_keywords(keyword)
      related_keywords = []

      SocketHelper.fetch( @host, wrap_request(keyword) ) do |body|
        return [] unless body
        body.scan(%r{<div id="rs"><div class="tt">相关搜索</div>.*}) do |match|
          return [] unless match
          related_keywords = match.scan(%r{<th><a href="[^"]+">([^<]+)</a></th>})
        end
      end

      related_keywords
    end

    def fetch_sites(keyword)
      sites = []

      SocketHelper.fetch( @host, wrap_request(keyword) ) do |body|
        return [] unless body
        body.scan(%r{<div id="content_left">.*}m) do |match|
          return [] unless match

          match.scan(%r{<div class="result.*?</div>}m) do |item|
            sites << item.scan(%r{<h3.*?>\s*?<a.*?href\s*=\s*"([^"]+)"[^>]*>(.*?)</a>}m)
          end
        end
      end

      sites
    end

  end

end
