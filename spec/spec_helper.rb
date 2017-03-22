$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pulse'
require 'vcr'
require 'pry'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
end

module Helpers
  HOST = '138.68.231.65'.freeze
  TOKEN = 'e7Eh4CqZfzpkXGSMKUFcAOn9l3dQT2tgvbHVoWLwDrsuPBm10Y'.freeze

  def pulse
    @pulse ||= Pulse.new(HOST, TOKEN)
  end
end
