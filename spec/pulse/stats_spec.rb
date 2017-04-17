require 'spec_helper'

describe Pulse::Stats do
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
      VCR.use_cassette('stats/keys') do
        expect(pulse.stats.keys).to be_an Array
      end
    end
  end

  describe '#tags' do
    it 'returns array' do
      VCR.use_cassette('stats/tags') do
        expect(pulse.stats.tags).to be_an Array
      end
    end
  end

  describe '#latest' do
    it 'returns array' do
      VCR.use_cassette('stats/latest') do
        result = pulse.stats.latest('disk_percent')
        expect(result).to be_a Hash
        expect(result.keys).to eq %w(time value)
      end
    end
  end

  describe '#hourly' do
    it 'returns array' do
      VCR.use_cassette('stats/hourly') do
        result = pulse.stats.hourly('disk_percent')
        expect(result).to be_an Array
      end
    end
  end

  describe '#daily' do
    it 'returns array' do
      VCR.use_cassette('stats/daily') do
        result = pulse.stats.daily('disk_percent')
        expect(result).to be_an Array
      end
    end
  end
end
