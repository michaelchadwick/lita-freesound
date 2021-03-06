require "spec_helper"

describe Lita::Handlers::Freesound, lita_handler: true do
  before do
    Lita.config.handlers.freesound.api_key = ENV['FREESOUND_KEY']
  end

  it { is_expected.to route_command("freesound rimshot").to(:get_sound) }
  it { is_expected.to route_command("fs monkey").to(:get_sound) }
  it { is_expected.to route_command("fs big old explosion").to(:get_sound) }

  describe "#get_sound" do
    it "responds with a link to the first query hit" do
      send_command("freesound gear clink")
      expect(replies.last).to match(/https:\/\/www.freesound.org\/data\/previews\/318\/318067_584239-hq.mp3/)
    end

    it "reports no results if search doesn't match anything" do
      send_command("freesound -$3")
      expect(replies.last).to match(/No sounds match/)
    end
  end
end
