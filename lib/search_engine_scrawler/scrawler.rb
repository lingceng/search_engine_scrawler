module SearchEngineScrawler

  class Scrawler

    def initialize(host, keyword)
      @host = host
      @keyword = keyword
    end

    def do_fetch
      socket = TCPSocket.open(@host, 80)
      socket.set_encoding 'UTF-8'
      socket.print wrap_request(@keyword)
      response = socket.read

      _headers,body = response.split("\r\n\r\n", 2)

      parse(body)
    end

    def wrap_request(keyword)
      "GET /index.html HTTP/1.0\r\n\r\n"
    end

    def parse(body)
      puts body
    end

  end

end