# lita-freesound

`lita-freesound` is a [Lita](http://lita.io) handler that searches [Freesound.org](http://freesound.org)'s multitudes of sounds and returns the top hit.

## Installation

Add `lita-freesound` to your Lita instance's `Gemfile`:

``` ruby
gem "lita-freesound"
```

## Configuration

### Required attributes

* `api_key` (String) - The bot's Freesound API key. Get one [here](http://www.freesound.org/apiv2/apply).

Add a line to your `lita_config.rb` with your Freesound API Key.

``` ruby
Lita.configure do |config|
  ...
  config.handlers.freesound.api_key = "FREESOUND_API_KEY_HERE"
  ...
end
```

### Testing

To run rspec's tests, please add your Freesound API key to an environment variable called `FREESOUND_KEY`.

## Usage

```
You: Lita, freesound cowbell
Lita: Cowbell - http://www.freesound.org/data/previews/75/75338_708954-hq.mp3
```

## License

[MIT](http://opensource.org/licenses/MIT)
