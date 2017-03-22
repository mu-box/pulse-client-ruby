require 'spec_helper'

describe Pulse do
  include Helpers

  it 'has a version number' do
    expect(Pulse::VERSION).not_to be nil
  end

  describe '#stat' do
    it 'returns an initialized stat object' do
      expect(pulse.stats).to be_a Pulse::Stats
    end
  end

  describe '#alert' do
    it 'returns an initialized alert object' do
      expect(pulse.alerts).to be_a Pulse::Alerts
    end
  end
end
