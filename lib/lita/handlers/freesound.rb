require 'net/http'
require 'json'

module Lita
  module Handlers
    class Freesound < Handler
      BASE_SEARCH_URL = "https://freesound.org/apiv2/search/text"
      BASE_SOUND_URL = "https://freesound.org/apiv2/sounds"

      config :api_key, type: String, required: true

      route(/(freesound|fs)(\s)/i, :get_sound, command: true, help: {
        "freesound SEARCH_TERM" => "Return the first Freesound search result for SEARCH_TERM"
      })

      def get_sound(response)
        query = response.args.join("+")

        api_token = Lita.config.handlers.freesound.api_key

        query_string = "#{BASE_SEARCH_URL}/?query=#{query}&token=#{api_token}&format=json"
        fs_search_response = Net::HTTP.get(
          URI(query_string)
        )

        data = JSON.parse(fs_search_response)

        if data['count']
          if data['count'] > 0
            results = data['results']

            sound_id = results[0]['id']
            sound_name = results[0]['name'].split('.')[0]

            fs_sound_response = Net::HTTP.get(
              URI("#{BASE_SOUND_URL}/#{sound_id}/?token=#{api_token}&format=json")
            )

            data = JSON.parse(fs_sound_response)

            preview_url = data['previews']['preview-hq-mp3']

            response.reply "#{sound_name} - #{preview_url}"
          else
            response.reply "No sounds match '#{query}'"
          end
        else
          response.reply "Freesound request failed."
          Lita.logger.error("Freesound request failed: #{response.inspect}.")
        end
      end

      Lita.register_handler(self)
    end
  end
end
