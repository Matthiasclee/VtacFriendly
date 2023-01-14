require_relative "vtac_friendly/vtac_client.rb"
require_relative "vtac_friendly/vtac_packet.rb"
require "socket"
require "json"

module VtacFriendly
  @ver_1 = 0
  @ver_2 = 0
  @ver_3 = 1
  @ver_4 = ""

  def self.version
    "#{@ver_1}.#{@ver_2}.#{@ver_3}#{".#{@ver_4}" if @ver_4.length > 1}"
  end
end
