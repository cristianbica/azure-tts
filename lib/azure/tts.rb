# frozen_string_literal: true

require "azure/tts/version"

require "faraday"
require "faraday_middleware"
require "ruby_speech"

require "azure/tts/constants"
require "azure/tts/errors"
require "azure/tts/api"
require "azure/tts/configuration"
require "azure/tts/token"
require "azure/tts/speaker"
require "azure/tts/voices"

module Azure
  module TTS
    include Azure::TTS::Constants

    module_function

    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
      reset
    end

    def voices
      @voices ||= Voices.new
    end

    def speak(text:, voice: nil, locale: nil, gender: nil, neural: nil, format: :audio_24khz_160kbitrate_mono_mp3) # rubocop:disable Metrics/ParameterLists
      voice ||= voices.find(locale: locale, gender: gender, neural: neural)
      Speaker.new(text: text, voice: voice, format: format).speak
    end

    def token
      @token ||= Token.new
      @token.tap(&:refresh)
    end

    def api
      @api ||= API.new
    end

    def reset
      @api = nil
      @voices = nil
      @token = nil
    end
  end
end
