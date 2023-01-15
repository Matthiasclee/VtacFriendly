module VtacFriendly
  module SystemTab
    def show(ip, name)
      puts "
#{R::C.color :blue}#{R::F.bold}IP#{R::F.reset} #{ip}
#{R::C.color :blue}#{R::F.bold}Server name#{R::F.reset} #{name}
"
    end

    def shutdown(server)
      server.puts VtacPacket.new(:command, "shutdown")
      VtacPacket.new(from_packet: server.gets)[:contents]
      R::Cr.show
      exit
    end

    def reboot(server)
      server.puts VtacPacket.new(:command, "reboot")
      VtacPacket.new(from_packet: server.gets)[:contents]
      R::Cr.show
      exit
    end

    def update(server)
      server.puts VtacPacket.new(:command, "update")
      VtacPacket.new(from_packet: server.gets)[:contents]
    end

    module_function :show, :shutdown, :reboot, :update
  end
end
