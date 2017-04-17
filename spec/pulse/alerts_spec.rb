require 'spec_helper'

describe Pulse::Alerts do
  include Helpers

  let(:attrs) do
    {
      tags: { host: 'abc'},
      metric: 'cpu_used',
      level: 'crit',
      threshold: '80',
      duration: '30s',
      post: 'http://127.0.0.1/alert'
    }
  end

  after do
    VCR.use_cassette('alerts/delete_all') do
      pulse.alerts.all.each { |a| pulse.alerts.delete(a['id']) }
    end
  end

  describe '#all' do
    it 'returns array of alerts' do
      VCR.use_cassette('alerts/all') do
        pulse.alerts.create(attrs)
        result = pulse.alerts.all
        expect(result).to be_an Array
      end
    end
  end

  describe '#find' do
    it 'returns an alert' do
      VCR.use_cassette('alerts/find') do
        alert = pulse.alerts.create(attrs)
        result = pulse.alerts.find(alert['id'])
        expect(result).to be_a Hash
      end
    end
  end

  describe '#create' do
    it 'creates an alert object' do
      VCR.use_cassette('alerts/create') do
        result = pulse.alerts.create(attrs)
        expect(result['id']).to be_a String
      end
    end
  end

  describe '#update' do
    it 'updates an alert object' do
      VCR.use_cassette('alerts/update') do
        alert = pulse.alerts.create(attrs)
        alert['threshold'] = '70'
        result = pulse.alerts.update(alert)
        expect(result['threshold']).to eq '70'
      end
    end
  end

  describe '#delete' do
    it 'deletes an alert object' do
      VCR.use_cassette('alerts/delete') do
        alert = pulse.alerts.create(attrs)
        result = pulse.alerts.delete(alert['id'])
        # e.g. {"msg"=>"Success"}
        expect(result).to be_a Hash
      end
    end
  end
end
