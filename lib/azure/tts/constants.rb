# frozen_string_literal: true

module Azure
  module TTS
    module Constants
      REGIONS = {
        australiaeast: "Australia East",
        canadacentral: "Canada Central",
        centralus: "Central US",
        eastasia: "East Asia",
        eastus: "East US",
        eastus2: "East US 2",
        francecentral: "France Central",
        centralindia: "India Central",
        japaneast: "Japan East",
        koreacentral: "Korea Central",
        northcentralus: "North Central US",
        northeurope: "North Europe",
        southcentralus: "South Central US",
        southeastasia: "Southeast Asia",
        uksouth: "UK South",
        westeurope: "West Europe",
        westus: "West US",
        westus2: "West US 2"
      }.freeze

      AUDIO_FORMATS = {
        raw_16khz_16bit_mono_pcm: "raw-16khz-16bit-mono-pcm",
        raw_8khz_8bit_mono_mulaw: "raw-8khz-8bit-mono-mulaw",
        riff_8khz_8bit_mono_alaw: "riff-8khz-8bit-mono-alaw",
        riff_8khz_8bit_mono_mulaw: "riff-8khz-8bit-mono-mulaw",
        riff_16khz_16bit_mono_pcm: "riff-16khz-16bit-mono-pcm",
        audio_16khz_128kbitrate_mono_mp3: "audio-16khz-128kbitrate-mono-mp3",
        audio_16khz_64kbitrate_mono_mp3: "audio-16khz-64kbitrate-mono-mp3",
        audio_16khz_32kbitrate_mono_mp3: "audio-16khz-32kbitrate-mono-mp3",
        raw_24khz_16bit_mono_pcm: "raw-24khz-16bit-mono-pcm",
        riff_24khz_16bit_mono_pcm: "riff-24khz-16bit-mono-pcm",
        audio_24khz_160kbitrate_mono_mp3: "audio-24khz-160kbitrate-mono-mp3",
        audio_24khz_96kbitrate_mono_mp3: "audio-24khz-96kbitrate-mono-mp3",
        audio_24khz_48kbitrate_mono_mp3: "audio-24khz-48kbitrate-mono-mp3"
      }.freeze

      TOKENS_URL = "https://%<region>s.api.cognitive.microsoft.com/sts/v1.0/issueToken"
      VOICES_URL = "https://%<region>s.tts.speech.microsoft.com/cognitiveservices/voices/list"
      TTS_URL    = "https://%<region>s.tts.speech.microsoft.com/cognitiveservices/v1"
    end
  end
end
