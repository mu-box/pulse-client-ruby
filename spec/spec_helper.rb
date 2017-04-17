$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pulse'
require 'vcr'
require 'pry'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
end

module Helpers
  HOST = '138.197.205.144'.freeze
  TOKEN = 'Hf8VOsdW9QAXP4pxR6UnuvBGalhiFewjyZDCtbq5TN1JI37YkE'.freeze

  def pulse
    @pulse ||= Pulse::Client.new(HOST, TOKEN)
  end
end
