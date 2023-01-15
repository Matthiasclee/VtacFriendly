module VtacFriendly
  module ConfigTab
    def show(server)
      server.puts VtacPacket.new(:command, "config pxsize")
      pxsize = VtacPacket.new(from_packet: server.gets)[:contents]

      server.puts VtacPacket.new(:command, "config roomlength")
      roomlength = VtacPacket.new(from_packet: server.gets)[:contents]

      server.puts VtacPacket.new(:command, "config mirrored")
      mirrored = VtacPacket.new(from_packet: server.gets)[:contents] == "0" ? "Off" : "On"

      puts "
#{R::C.color :blue}#{R::F.bold}Pxsize#{R::F.reset} #{pxsize}
#{R::C.color :blue}#{R::F.bold}Room length#{R::F.reset} #{roomlength}
#{R::C.color :blue}#{R::F.bold}Mirroring#{R::F.reset} #{mirrored}
"
    end

    def change_pxsize(server)
      R::Cr.go_to_pos(0, R::S.height-1)
      R::C.color :gray, type: :bg, mode: :set
      print "Pxsize: "

      R::Cr.show
      server.puts VtacPacket.new(:command, "config pxsize #{STDIN.gets.chomp}")
      R::Cr.hide

      R::C.color :reset, type: :bg, mode: :set

      VtacPacket.new(from_packet: server.gets)[:contents]
    end

    def change_roomlength(server)
      R::Cr.go_to_pos(0, R::S.height-1)
      R::C.color :gray, type: :bg, mode: :set
      print "Room length: "

      R::Cr.show
      server.puts VtacPacket.new(:command, "config roomlength #{STDIN.gets.chomp}")
      R::Cr.hide

      R::C.color :reset, type: :bg, mode: :set

      VtacPacket.new(from_packet: server.gets)[:contents]
    end

    def toggle_mirroring(server)
      server.puts VtacPacket.new(:command, "config mirrored toggle")
      VtacPacket.new(from_packet: server.gets)[:contents]
    end

    module_function :show, :change_pxsize, :change_roomlength, :toggle_mirroring
  end
end
