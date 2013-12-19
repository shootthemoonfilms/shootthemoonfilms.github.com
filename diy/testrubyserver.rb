#!/usr/bin/env ruby
require 'webrick'
include WEBrick

dir = ENV['OPENSHIFT_REPO_DIR']

config = {}
config.update(:Port => 80)
config.update(:BindAddress => ARGV[0])
config.update(:DocumentRoot => dir + 'public')
server = HTTPServer.new(config)
['INT', 'TERM'].each {|signal|
  trap(signal) {server.shutdown}
}

server.start
