module SearchEngineScrawler

  class Scrawler

    def initialize(host)
      @host = host
    end

    def fetch(keyword)
      socket = TCPSocket.open(@host, 80)
      socket.set_encoding 'UTF-8'

      socket.print wrap_request(keyword)
      response = socket.read
      _headers,body = response.split("\r\n\r\n", 2)
      parse_keywords(body)

      socket.close
    end

    def wrap_request(keyword)
      "GET /index.html HTTP/1.0\r\n\r\n"
    end

    def parse_keywords(body)
      raise 'Not implement'
    end

  end

end
