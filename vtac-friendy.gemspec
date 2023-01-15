require_relative "lib/vtac_friendly.rb"

exe=['vtac-ui']

Gem::Specification.new do |s|
  s.name        = 'vtacfriendly'
  s.version     = VtacFriendly.version
  s.summary     = "Vtac UI"
  s.description = "A friendly interface for VTAC"
  s.authors     = ["Matthias Lee"]
  s.email       = 'matthias@matthiasclee.com'
  s.files       = [
    "lib/vtac_friendly.rb",
    "lib/vtac_friendly/vtac_packet.rb",
    "lib/vtac_friendly/vtac_client.rb",
    "lib/vtac_friendly/analytics_tab.rb",
    "lib/vtac_friendly/config_tab.rb",
  ] + exe.map{|i|"bin/#{i}"}
  s.executables = exe
  s.add_runtime_dependency "argparse", '~> 0.0.3'
  s.add_runtime_dependency "rbtext", '~> 0.3.2'
  s.add_runtime_dependency "io-console", '~> 0.5.6'
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/Matthiasclee/VtacFriendly'
  s.license = 'AGPL-3.0'
end
