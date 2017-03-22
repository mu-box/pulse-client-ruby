require 'spec_helper'

describe PulseClient::Stats do
  include Helpers

  # let(:attrs) do
  #   { tags: { host: 'abc'},
  #     metric: 'cpu_used',
  #     level: 'crit',
  #     threshold: 80,
  #     duration: '30s',
  #     post: 'http://127.0.0.1/alert'
  #   }
  # end

  describe '#keys' do
    it 'returns array' do
      VCR.use_cassette('keys') do
        expect(pulse.stats.keys).to be_an Array
      end
    end
  end

  describe '#tags' do
    it 'returns array' do
      VCR.use_cassette('tags') do
        expect(pulse.stats.tags).to be_an Array
      end
    end
  end
end
