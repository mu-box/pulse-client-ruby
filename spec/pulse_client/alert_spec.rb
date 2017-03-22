require 'spec_helper'

describe PulseClient::Alerts do
  include Helpers

  let(:attrs) do
    {
      tags: { host: 'abc'},
      metric: 'cpu_used',
      level: 'crit',
      threshold: 80,
      duration: '30s',
      post: 'http://127.0.0.1/alert'
    }
  end

  describe '#create' do
    it 'creates an alert object' do
      VCR.use_cassette('alert_create') do
        result = pulse.alerts.create(attrs)
        expect(result['id']).to be_a String
        pulse.alerts.delete(result['id'])
      end
    end
  end

  describe '#update' do
    it 'updates an alert object' do
      VCR.use_cassette('alert_update') do
        alert = pulse.alerts.create(attrs)
        alert['threshold'] = 70
        result = pulse.alerts.update(alert)
        expect(result['threshold']).to eq 70
        pulse.alerts.delete(result['id'])
      end
    end
  end
end
