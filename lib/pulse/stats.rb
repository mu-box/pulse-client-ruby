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
end
