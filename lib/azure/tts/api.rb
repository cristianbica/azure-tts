# frozen_string_literal: true

module Azure
  module TTS
    class API
      include Constants

      def config
        Azure::TTS.config
      end

      def tokens
        @tokens ||= Faraday.new(url: config.tokens_url, headers: { "Ocp-Apim-Subscription-Key" => config.api_key }) do |connection|
          connection.adapter Faraday.default_adapter
        end
      end

      def voices
        @voices ||= Faraday.new(url: config.voices_url) do |connection|
          connection.request :azure_tts_token_auth
          connection.request :json
          connection.response :json
          connection.adapter Faraday.default_adapter
        end
      end

      def tts
        @tts ||= Faraday.new(url: config.tts_url) do |connection|
          connection.request :azure_tts_token_auth
          connection.adapter Faraday.default_adapter
        end
      end
    end

    class TokenAuthMiddleware < Faraday::Middleware
      def initialize(app)
        super(app)
      end

      def call(env)
        env[:request_headers]["Authorization"] = "Bearer #{Azure::TTS.token}"
        @app.call(env)
      end
    end
    Faraday::Request.register_middleware azure_tts_token_auth: -> { TokenAuthMiddleware }
  end
end
