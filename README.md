# Azure::TTS

Text-to-speech gem based using Azure Cognitive Speech Services.

Status: alpha (it works, has just some basic testing and it's not use anywhere in production)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'azure-tts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install azure-tts

## Usage

Obtain a Cognitive Services Subscription key ([get a trial one here](https://azure.microsoft.com/try/cognitive-services/)). Read more about the Cognitive Services TTS [here](https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-text-to-speech).

```ruby

Azure::TTS.configure do |config|
  config.region = "eastus"
  config.api_key = "YOUR_SUBSCRIPTION_KEY"
end

Azure::TTS.voices # => returns a list of voices available in the region

Azure::TTS.(text: "Hello world!", locale: "en_US", gender: :female, neural: true)
Azure::TTS.(text: "Hello world!", locale: "en_US", gender: :female)
Azure::TTS.(text: "Hello world!", locale: "en_US", format: :audio_24khz_160kbitrate_mono_mp3)
```

Note: see `constants.rb` for available formats.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cristianbica/azure-tts.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
