# lita-freesound

`lita-freesound` is a [Lita](http://lita.io) handler that searches Freesound.org's multitudes of sounds and returns the top hit.

## Installation

Add lita-freesound to your Lita instance's Gemfile:

``` ruby
gem "lita-freesound"
```

## Configuration

### Required attributes

* `api_key` (String) - The bot's Freesound API key. Get one [here](http://www.freesound.org/apiv2/apply).

## Usage

```
You: Lita, freesound cowbell
Lita: Cowbell - http://www.freesound.org/data/previews/75/75338_708954-hq.mp3
```

## License

[MIT](http://opensource.org/licenses/MIT)
