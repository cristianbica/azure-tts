# frozen_string_literal: true

module Azure
  module TTS
    class Configuration
      include Azure::TTS::Constants

      attr_accessor :api_key, :region, :default_voice, :default_audio_format

      def initialize
        @default_voice = ""
        @default_audio_format = :audio_24khz_160kbitrate_mono_mp3
      end

      def tokens_url
        format(TOKENS_URL, region: region)
      end

      def voices_url
        format(VOICES_URL, region: region)
      end

      def tts_url
        format(TTS_URL, region: region)
      end
    end
  end
end
