class Pulse::Stats

  attr_reader :request

  def initialize(request)
    @request = request
  end

  # e.g. ["disk_percent", "ram_percent", "ram_used", "swap_percent", "cpu_percent"]
  def keys
    request.get '/keys'
  end

  # e.g. ["component", "generation", "host", "member"]
  def tags
    request.get '/tags'
  end

  # e.g. {"time":1492450500000,"value":9.0709}
  def latest(stat)
    request.get "/latest/#{stat}"
  end

  # e.g. [{"time":1492444800000,"value":9.070713333333332},{"time":1492448400000,"value":9.070393333333332}]
  def hourly(stat)
    request.get "/hourly/#{stat}"
  end

  # e.g. [{"time":"17:00","value":9.070266666666669},{"time":"17:15","value":9.070519999999997},{"time":"16:45","value":9.070713333333332}]
  def daily(stat)
    request.get "/daily/#{stat}"
  end
end
