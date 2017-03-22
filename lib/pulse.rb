class Pulse
  VERSION = "0.0.0"

  # General Error that more specific errors inherit from.
  class Error             < StandardError; end
  # Error connecting to host
  class ConnectionError   < Error; end
  # http 3xx Redirection
  class RedirectionError  < Error; end
  # http 401
  class UnauthorizedError < Error; end
  # http 404
  class NotFoundError     < Error; end
  # http 4xx Client Error
  class ClientError       < Error; end
  # http 5xx Server Error
  class ServerError       < Error; end

  attr_reader :request

  def initialize(host = '127.0.0.1', token = '123')
    @request = Request.new(host, token)
  end

  def stats
    Stats.new(request)
  end

  def alerts
    Alerts.new(request)
  end
end

require "pulse/stats"
require "pulse/alerts"
require "pulse/request"
