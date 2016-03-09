require "spec_helper"

describe Lita::Handlers::Freesound, lita_handler: true do
  it { is_expected.to route_command("freesound rimshot").to(:get_sound) }
  it { is_expected.to route_command("fs explosion").to(:get_sound) }

  describe "#get_sound" do
    it "responds with a link to the first query hit" do
    end
  end
end
