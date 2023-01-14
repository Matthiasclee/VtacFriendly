module VtacFriendly
  module Client
    def connect(host, port)
      server = TCPSocket.open(host, port)

      init_pack = VtacPacket.new(from_packet: server.gets)
      server_name = init_pack[:contents]

      server.puts VtacPacket.new(:id_client, "vtac_client")

      return server
    end

    module_function :connect
  end
end
