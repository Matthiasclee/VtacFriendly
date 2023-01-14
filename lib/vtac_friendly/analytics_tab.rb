module VtacFriendly
  module AnalyticsTab
    def show(server)
      # Draw remotes
      sh15 = "
╔═════════════╗
║  -A0   -A1  ║
║             ║
║     -A2     ║
║ -A3 -A4 -A5 ║
║     -A6     ║
║             ║
║  -A7   -A8  ║
║  -A9   -AA  ║
║  -AB   -AC  ║
║  -AD   -AE  ║
╚═════════════╝
      "

      # Get data
      sh15_buttons = ["A0", "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "AA", "AB", "AC", "AD", "AE"]
      sh15_buttons.each do |b|
        server.puts VtacPacket.new(:command, "analytics keypresses view #{b}")
        num = VtacPacket.new(from_packet: server.gets)[:contents]
        if num == ""
          num = "000"
        elsif num.length > 3
          num = "999"
        elsif num.length < 3
          num = "0"*(3-(num.length)) + num
        end
        sh15.gsub!(?-+b, num)
      end

      puts sh15

    end

    module_function :show
  end
end
