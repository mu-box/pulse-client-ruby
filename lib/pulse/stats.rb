class Pulse::Stats

  attr_reader :request

  def initialize(request)
    @request = request
  end

  def keys
    request.get '/keys'
    # e.g. ["disk_percent", "ram_percent", "ram_used", "swap_percent", "cpu_percent"]
  end

  # Note: host is by uid(do.1), all others by uuid
  def tags
    request.get '/tags'
    # e.g. ["component", "generation", "host", "member"]
  end

  # e.g.
  # latest(disk_percent, host: 'do.1')
  # latest(disk_percent, component: '76ad1cfd-1b98-408f-ba0a-f1bdf1bb6008')
  def latest(stat, filters = {})
    request.get "/latest/#{stat}#{query_string(filters)}"
    # e.g. {"time":1492450500000,"value":9.0709}
  end

  def hourly(stat, filters = {})
    request.get "/hourly/#{stat}#{query_string(filters)}"
    # e.g. [{"time":1492444800000,"value":9.070713333333332},{"time":1492448400000,"value":9.070393333333332}]
  end

  def daily(stat, filters = {})
    request.get "/daily/#{stat}#{query_string(filters)}"
    # e.g. [{"time":"17:00","value":9.070266666666669},{"time":"17:15","value":9.070519999999997},{"time":"16:45","value":9.070713333333332}]
  end

  private

  def query_string(enum)
    return if enum.empty?
    "?#{URI.encode_www_form(enum)}"
  end
end
