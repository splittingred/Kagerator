require File.dirname(__FILE__) + '/kagerator/request'
##
# The main Kagerator class for consumption
#
module Kagerator
  ##
  # Get a player information
  #
  # @param [String] name The username of the player
  # @param [Boolean] load_avatar Whether or not to add the avatar to the data loaded. Makes another HTTP request to the API
  # @return [SymbolTable] A hash of the player data
  #
  def self.player(name,load_avatar = true)
    player = Kagerator::Request.execute({
      :url => "player/#{name}/status",
      :method => :get
    })
    if player
      player = player.from_json
      if load_avatar
        avatar = Kagerator::Request.execute({
          :url => "player/#{name}/avatar",
          :method => :get
        })
        if avatar
          player[:avatar] = avatar.from_json
        end
      end
      player
    else
      false
    end
  end

  ##
  # Get a list of servers, filtered by any arguments
  #
  # @param [Hash] args A hash of arguments to filter with
  # @return [SymbolTable] An array of hashes of results
  #
  def self.servers(args = {})
    qs = ''
    if args.class == Hash or args.class == SymbolTable
      args.each do |k,v|
        qs += '/'+k.to_s+'/'+v.to_s
      end
    end
    servers = Kagerator::Request.execute({
      :url => "servers/connectable/1"+qs,
      :method => :get
    })
    servers.from_json
  end

  ##
  # Get information about a specific server
  #
  # @param [String] ip The IP address of the server, in ipv4 or ipv6 format
  # @param [String|Integer] port The port of the server
  # @return [SymbolTable] A hash of the server variables
  #
  def self.server(ip,port = 50301)
    server = Kagerator::Request.execute({
      :url => "server/ip/#{ip}/port/#{port}/status",
      :method => :get
    })
    server.from_json
  end
end