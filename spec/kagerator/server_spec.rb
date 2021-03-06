require 'spec_helper'
require 'lib/kagerator'
##
# Testing for the server functions
#
describe Kagerator do
  subject { }

  it "ensure server() works" do
    server = Kagerator.server("74.91.114.49",50301)
    server.should_not eq(false)
    if server
      server[:serverStatus][:serverIPv4Address].should eq("74.91.114.49")
    end
  end

  it "ensure servers() works" do
    servers = Kagerator.servers
    servers.should_not eq(false)
  end

  it "ensure servers() with empty/full filter works" do
    servers = Kagerator.servers({:empty => 0,:full => 0})
    servers.should_not eq(false)
  end
end