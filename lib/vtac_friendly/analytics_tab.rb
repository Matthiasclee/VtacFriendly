module VtacFriendly
  module AnalyticsTab
    def show(server)
      # Draw remotes
      sh15 = "
#{R::C.color :green}╔═════════════╗
║  -A0   -A1  #{R::C.color :green}║
║             #{R::C.color :green}║
║     -A2     #{R::C.color :green}║
║ -A3 -A4 -A5 #{R::C.color :green}║
║     -A6     #{R::C.color :green}║
║             #{R::C.color :green}║
║  -A7   -A8  #{R::C.color :green}║
║  -A9   -AA  #{R::C.color :green}║
║  -AB   -AC  #{R::C.color :green}║
║  -AD   -AE  #{R::C.color :green}║
╚═════════════╝
#{R::C.color :reset}"

      # Get data
      sh15_buttons = ["A0", "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "AA", "AB", "AC", "AD", "AE"]
      white_spectrum_colors = (232..245).to_a.reverse
      sh15_keypresses_by_usage={}
      sh15_buttons_color = {}

      # Get heatmap colors
      sh15_buttons.each do |b|
        server.puts VtacPacket.new(:command, "analytics keypresses view #{b}")
        sh15_keypresses_by_usage[b] = VtacPacket.new(from_packet: server.gets)[:contents].to_i
      end

      max_num = sh15_keypresses_by_usage.values.max

      sh15_keypresses_by_usage.keys.each do |k|
        percentile = (sh15_keypresses_by_usage[k].to_f/max_num.to_f)*100
        num = white_spectrum_colors[(percentile/(100.0/white_spectrum_colors.length)).to_i-1]
        sh15_buttons_color[k] = num
      end

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

        num = "#{R::C.color :red}#{R::C.num_color sh15_buttons_color[b], type: :bg}#{num}#{R::C.color :reset}#{R::C.color :reset, type: :bg}"

        sh15.gsub!(?-+b, num)
      end

      puts sh15

    end

    module_function :show
  end
end
