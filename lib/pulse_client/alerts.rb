class PulseClient::Alerts

  attr_reader :request

  # attrs:
  #   "id": 1234,
  #   "tags": {"host":"abc"},
  #   "metric": "cpu_used",
  #   "level": "crit",
  #   "threshold": 80,
  #   "duration": "30s",
  #   "post": "http://127.0.0.1/alert"

  def initialize(request)
    @request = request
  end

  # e.g. result
  # {
  #   "id"=>"51c054e9-93cb-45ed-bd83-8ed838cbd4d4",
  #   "tags"=>{"host"=>"abc"},
  #   "metric"=>"cpu_used",
  #   "level"=>"crit",
  #   "threshold"=>80,
  #   "duration"=>"30s",
  #   "post"=>"http://127.0.0.1/alert"
  # }
  def create(attrs)
    request.post '/alerts', attrs
  end

  def update(attrs)
    request.put '/alerts', attrs
  end

  # {"msg"=>"Success"}
  def delete(id)
    request.delete "/alerts/#{id}"
  end
end
