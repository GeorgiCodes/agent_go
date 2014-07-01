require 'agent'
require 'socket'

class EchoServer
  attr_accessor :host, :port

  def initialize(port)
    @port = port
    @server = TCPServer.new @port
  end

  def handle_client(client)
    loop do
      line = client.gets
      client.puts line
    end
  end

  def start
    loop do
      client =  @server.accept
      puts 'accepted'
      go! do
        handle_client(client)
        #could do other stuff here
      end
    end
  end
end

server = EchoServer.new(1337)
server.start()
