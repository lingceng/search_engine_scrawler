module SearchEngineScrawler

  module ScrawlerHelper

    def fetch(host, request)
      TCPSocket.open(host, 80) do |socket|
        socket.set_encoding 'UTF-8'

        socket.print request
        # Use scrub to replace illegal encoding
        # FIXME: Response sometimes get nothing
        response = socket.read.scrub('x')
        _headers,body = response.split("\r\n\r\n", 2)

        yield body

      end
    end

  end

end
