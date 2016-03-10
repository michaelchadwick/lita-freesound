require "spec_helper"

describe Lita::Handlers::Freesound, lita_handler: true do
  it { is_expected.to route_command("freesound rimshot").to(:get_sound) }
  it { is_expected.to route_command("fs explosion").to(:get_sound) }

  describe "#get_sound" do
    it "responds with a link to the first query hit" do
      send_message("freesound gear_clink")
      expect(replies.last).to match(/http:\/\/freesound.org\/people\/nebyoolae\/sounds\/318067\//)
    end

    it "reports no results if search doesn't match anything" do
      send_message("freesound -$3")
      expect(replies.last).to match(/No search results for query:/)
    end
  end
end
