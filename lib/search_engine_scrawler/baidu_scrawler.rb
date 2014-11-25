require 'search_engine_scrawler/scrawler'

module SearchEngineScrawler

  class BaiduScrawler < Scrawler

    def wrap_request(keyword)
      "GET /s?wd=#{keyword} HTTP/1.0\r\n\r\n"
    end

    def parse(body)
      # OPTIMIZE: better regex
      body.scan(%r{<div id="rs"><div class="tt">相关搜索</div>.*}) do |match|
        match.scan(%r{<th><a href="[^"]+">([^>]+)</a></th>}) do |keyword|
          puts keyword
        end
      end
    end

  end

end
