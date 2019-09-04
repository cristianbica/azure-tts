# frozen_string_literal: true

module Azure
  module TTS
    class Token
      attr_reader :token, :obtained_at

      def refresh
        return unless needs_refreshing?

        response = Azure::TTS.api.tokens.post
        raise RequestError, response unless response.success?

        @token = response.body
        @obtained_at = Time.now.to_i
      end

      def needs_refreshing?
        (Time.now.to_i - obtained_at.to_i) > 600
      end

      def to_s
        token
      end
    end
  end
end
