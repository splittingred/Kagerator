require 'spec_helper'
require 'lib/kagerator'

describe Kagerator do
  subject { }

  it "ensure player() works" do
    player = Kagerator.player("splittingred")
    player.should_not eq(false)
    if player
      player[:playerInfo][:username].should eq("splittingred")
    end
  end
end