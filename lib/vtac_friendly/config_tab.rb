module VtacFriendly
  module ConfigTab
    def show(server)
      server.puts VtacPacket.new(:command, "config pxsize")
      pxsize = VtacPacket.new(from_packet: server.gets)[:contents]

      server.puts VtacPacket.new(:command, "config roomlength")
      roomlength = VtacPacket.new(from_packet: server.gets)[:contents]

      puts "Pxsize: #{pxsize}"
      puts "Room length: #{roomlength}"
    end

    module_function :show
  end
end
