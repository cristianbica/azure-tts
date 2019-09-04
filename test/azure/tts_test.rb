# frozen_string_literal: true

require "test_helper"

class Azure::TTSTest < Minitest::Spec
  around do |test|
    VCR.use_cassette("azure", record: :none) do
      test.call
    end
  end
  it "should have a version" do
    refute_nil ::Azure::TTS::VERSION
  end

  it "should fetch a token" do
    assert Azure::TTS.token.to_s.length.positive?
  end

  it "should fetch the voices" do
    assert Azure::TTS.voices.all.size.positive?
  end

  it "should skeap a text" do
    assert Azure::TTS.speak(text: "Hello world!", locale: "en-US", gender: :female, neural: true)
  end
end
