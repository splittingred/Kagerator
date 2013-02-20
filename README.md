# Kagerator

Consumes the KAG API.

## Usage

<pre>
require 'kagerator'

player = Kagerator.player("splittingred")
puts player[:playerInfo][:status]

server = Kagerator.server("74.91.114.49",50301)
puts server[:serverStatus][:description]
</pre>
