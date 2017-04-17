class Pulse::Client
  attr_reader :request

  def initialize(host = '127.0.0.1', token = '123')
    @request = ::Pulse::Request.new(host, token)
  end

  def stats
    ::Pulse::Stats.new(request)
  end

  def alerts
    ::Pulse::Alerts.new(request)
  end
end
