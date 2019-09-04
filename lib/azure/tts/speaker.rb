# frozen_string_literal: true

module Azure
  module TTS
    class Speaker
      def initialize(text:, voice:, format:)
        @text = text
        @voice = voice
        @format = format
      end

      def speak
        response = Azure::TTS.api.tts.post(nil, ssml, headers)
        raise RequestError, response unless response.success?

        response.body
      end

      def ssml
        ssml = RubySpeech::SSML.draw
        ssml.voice gender: @voice.gender, name: @voice.short_name, language: @voice.locale, content: @text
        ssml.to_s
      end

      def headers
        {
          "Content-Type" => "application/ssml+xml",
          "X-Microsoft-OutputFormat" => Azure::TTS::AUDIO_FORMATS[@format],
          "User-Agent" => "Azure::TTS"
        }
      end
    end
  end
end
