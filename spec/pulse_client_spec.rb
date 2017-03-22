require 'spec_helper'

describe PulseClient do
  include Helpers

  it 'has a version number' do
    expect(PulseClient::VERSION).not_to be nil
  end

  describe '#stat' do
    it 'returns an initialized stat object' do
      expect(pulse.stats).to be_a PulseClient::Stats
    end
  end

  describe '#alert' do
    it 'returns an initialized alert object' do
      expect(pulse.alerts).to be_a PulseClient::Alerts
    end
  end
end
