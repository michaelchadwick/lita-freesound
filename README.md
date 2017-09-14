# lita-freesound

Lita handler for interfacing with Freesound.org's multitudes of free sounds.

## Installation

Add lita-freesound to your Lita instance's Gemfile:

``` ruby
gem "lita-freesound"
```

## Configuration

Add a line to your `lita_config.rb` with your Freesound API Key.

``` ruby
Lita.configure do |config|
  ...
  config.handlers.freesound.api_key = "FREESOUND_API_KEY_HERE"
  ...
end
```
