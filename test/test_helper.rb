# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "azure/tts"
require "minitest/spec"
require "minitest/autorun"
require "minitest/around/spec"
require "webmock/minitest"
require "vcr"

Azure::TTS.configure do |config|
  config.api_key = "TEST-KEY"
  config.region = :eastus
end

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr"
  config.hook_into :webmock
end
