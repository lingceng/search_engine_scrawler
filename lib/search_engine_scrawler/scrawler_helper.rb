module SearchEngineScrawler

  module ScrawlerHelper

    def fetch(host, request)
      socket = TCPSocket.open(host, 80)
      socket.set_encoding 'UTF-8'

      socket.print request
      response = socket.read.scrub('x')
      _headers,body = response.split("\r\n\r\n", 2)
      yield body
      socket.close
    end

  end

end
