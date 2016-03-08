module Lita
  module Handlers
    class Freesound < Handler
      URL = "http://freesound.org/apiv2/search/test/"
      NO_RESULTS = 'Freesound has no results for that.'

      config :api_key, type: String, required: true

      route(/freesound|fs/i, :get_sound, command: true, help: {
        "freesound SEARCH_TERM" => "Return the first Freesound search result for SEARCH_TERM"
      })

      def get_sound(response)
        query = response.matches[0][0]

        http_response = http.get(
          "#{URL}?query=#{query}&token=#{Lita.config.handlers.freesound.api_key}",
          limit: 1
        )

        case http_response.status
        when 200
          data = MultiJson.load(http_response.body)

          result = data["responseData"]["results"]

          if result
            response.reply result
            )
          else
            response.reply("No search results for query: #{query}")
          end
        when 404
          NO_RESULTS
        else
          Lita.logger.warn(
            "Freesound did not like the query: #{query}"
          )
        end
      end

      Lita.register_handler(self)
    end
  end
end
