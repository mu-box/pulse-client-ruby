module Pulse
  # Base error that more specific errors inherit from.
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
end

require "pulse/alerts"
require "pulse/client"
require "pulse/request"
require "pulse/stats"
require "pulse/version"
