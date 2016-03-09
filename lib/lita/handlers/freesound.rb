require 'net/http'
require 'json'

module Lita
  module Handlers
    class Freesound < Handler
      BASE_URL = "http://freesound.org/apiv2/search/text/"
      NO_RESULTS = 'Freesound has no results for that.'

      config :api_key, type: String, required: true

      route(/freesound|fs/i, :get_sound, help: {
        "freesound SEARCH_TERM" => "Return the first Freesound search result for SEARCH_TERM"
      })

      def get_sound(response)
        query = response.args.join

        fs_response = Net::HTTP.get(
          URI("#{BASE_URL}?query=#{query}&token=#{Lita.config.handlers.freesound.api_key}&format=json")
        )

        data = JSON.parse(fs_response)

        result = data['results']

        if result
          first_hit = result[0]
          sound_id = first_hit['id']
          username = first_hit['username']
          response.reply "http://freesound.org/people/#{username}/sounds/#{sound_id}"
        else
          response.reply("No search results for query: #{query}")
        end
      end

      Lita.register_handler(self)
    end
  end
end
