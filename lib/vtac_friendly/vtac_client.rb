module VtacFriendly
  module Client
    def connect(host, port)
      server = TCPSocket.open(host, port)

      init_pack = VtacPacket.new(from_packet: server.gets)
      server_id = init_pack[:contents].split("~")

      server_name = server_id[0]
      server_version = server_id[1]
      auth_required = server_id[2] ? true : false

      server.puts VtacPacket.new(:id_client, "vtac_client")

      if auth_required
        print "Password: "
        server.puts VtacPacket.new(:password, STDIN.gets.chomp)

        response = VtacPacket.new(from_packet: server.gets)

        if response[:type] == "error"
          STDERR.puts "ERROR: " + response[:contents]
          exit 1
        end
      end

      return [server, server_name, server_version, auth_required]
    end

    module_function :connect
  end
end
