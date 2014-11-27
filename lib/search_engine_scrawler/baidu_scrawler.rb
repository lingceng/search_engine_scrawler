require 'search_engine_scrawler/scrawler_helper'

module SearchEngineScrawler

  class BaiduScrawler
    include ScrawlerHelper

    def initialize()
      @host = 'www.baidu.com'
    end

    def wrap_request(keyword)
      "GET /s?wd=#{keyword} HTTP/1.0\r\n\r\n"
    end

    def fetch_related_keywords(keyword)
      related_keywords = []

      fetch( @host, wrap_request(keyword) ) do |body|
        return [] unless body
        body.scan(%r{<div id="rs"><div class="tt">相关搜索</div>.*}) do |match|
          return [] unless match
          related_keywords = match.scan(%r{<th><a href="[^"]+">([^>]+)</a></th>})
        end
      end

      related_keywords
    end

  end

end
