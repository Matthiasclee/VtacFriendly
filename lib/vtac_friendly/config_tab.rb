module VtacFriendly
  module ConfigTab
    def show(server)
      server.puts VtacPacket.new(:command, "config pxsize")
      pxsize = VtacPacket.new(from_packet: server.gets)[:contents]

      server.puts VtacPacket.new(:command, "config roomlength")
      roomlength = VtacPacket.new(from_packet: server.gets)[:contents]

      puts "
#{R::C.color :blue}#{R::F.bold}Pxsize#{R::F.reset} #{pxsize}
#{R::C.color :blue}#{R::F.bold}Room length#{R::F.reset} #{roomlength}
"
    end

    module_function :show
  end
end
