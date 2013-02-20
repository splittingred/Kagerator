# Kagerator

Consumes the KAG API.

## Usage

<pre>
require 'kagerator'

# player info
player = Kagerator.player("splittingred")
puts player[:playerInfo][:status]

# server info
server = Kagerator.server("74.91.114.49",50301)
puts server[:serverStatus][:description]

# server list
servers = Kagerator.servers({:empty => 0,:full => 0})
servers[:serverList].each do |server|
  puts server[:serverName]+'<br />'
end
</pre>

## Info

Written by Shaun McCormick

Uses RestClient, SymbolTable and JSON gems, with RSpec for testing

Released under the GPLv2 or later License: http://www.gnu.org/licenses/gpl-2.0.html