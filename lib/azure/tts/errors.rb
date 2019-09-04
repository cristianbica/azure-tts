# frozen_string_literal: true

module Azure
  module TTS
    class Error < StandardError; end

    class RequestError < Error
      attr_reader :response

      def initialize(response)
        @response = response
        super(exception_message)
      end

      def exception_message # rubocop:disable Metrics/AbcSize
        format(
          "%<method>s request to %<url>s failed with status %<status>s (%<status_text>s). Response body: %<body>s",
          method: response.env.method.to_s.upcase,
          url: response.env.url.to_s,
          status: response.status,
          status_text: response.reason_phrase,
          body: response.body
        )
      end
    end
  end
end
