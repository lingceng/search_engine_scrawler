require 'search_engine_scrawler/scrawler'

module SearchEngineScrawler

  class BaiduScrawler < Scrawler

    def initialize(keyword_max: 100)
      super 'www.baidu.com'
      @keywords = []
      @keyword_max = keyword_max
    end

    def wrap_request(keyword)
      "GET /s?wd=#{keyword} HTTP/1.0\r\n\r\n"
    end

    def parse_keywords(body)
      return if body.nil?

      # OPTIMIZE: better regex
      body.scan(%r{<div id="rs"><div class="tt">相关搜索</div>.*}) do |match|
        next if match.nil?

        match.scan(%r{<th><a href="[^"]+">([^>]+)</a></th>}) do |keyword|
          if !@keywords.include? keyword
            puts keyword, @keywords.size
            @keywords << keyword
            if @keywords.size <= @keyword_max
              fetch keyword
            end
          end
        end

      end
    end

  end

end
