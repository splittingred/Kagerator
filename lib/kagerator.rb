require File.dirname(__FILE__) + '/kagerator/request'

module Kagerator
  def self.player(name,avatar = true)
    player = Kagerator::Request.execute({
      :url => "player/#{name}/status",
      :method => :get
    })
    if player
      player = player.from_json
      avatar = Kagerator::Request.execute({
        :url => "player/#{name}/avatar",
        :method => :get
      })
      if avatar
        player[:avatar] = avatar.from_json
      end
      player
    else
      false
    end
  end

  ##
  # @TODO: filtering with args
  def self.servers(args = {})
    servers = Kagerator::Request.execute({
      :url => "servers/connectable/1",
      :method => :get
    })
    servers.from_json
  end

  def self.server(ip,port = 50301)
    server = Kagerator::Request.execute({
      :url => "server/ip/#{ip}/port/#{port}/status",
      :method => :get
    })
    server.from_json
  end
end