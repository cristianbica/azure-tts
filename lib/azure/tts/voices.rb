# frozen_string_literal: true

module Azure
  module TTS
    class Voices
      attr_reader :all

      def initialize
        fetch
      end

      def fetch
        response = Azure::TTS.api.voices.get
        raise RequestError, response unless response.success?

        @all = response.body.map { |data| Voice.new(data) }
      end

      def find(locale: nil, gender: nil, neural: nil)
        voices = all
        voices = voices.select { |voice| voice.locale == locale } if locale
        voices = voices.select { |voice| voice.gender == gender } if gender
        voices = voices.sort_by { |voice| voice.neural? ? 0 : 1 } if neural
        voices.first
      end
    end

    class Voice
      attr_reader :name, :short_name, :gender, :locale

      def initialize(data)
        @name = data["Name"]
        @short_name = data["ShortName"]
        @gender = data["Gender"].downcase.to_sym
        @locale = data["Locale"]
      end

      def neural?
        name =~ /Neural/
      end
    end
  end
end
