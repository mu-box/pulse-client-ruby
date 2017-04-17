require 'spec_helper'

describe Pulse::Client do
  include Helpers

  describe '#stats' do
    it 'returns an initialized stats object' do
      expect(pulse.stats).to be_a Pulse::Stats
    end
  end

  describe '#alerts' do
    it 'returns an initialized alerts object' do
      expect(pulse.alerts).to be_a Pulse::Alerts
    end
  end
end
