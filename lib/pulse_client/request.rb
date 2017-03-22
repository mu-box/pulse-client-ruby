require 'faraday'
require 'json'

class PulseClient::Request

  attr_reader :host
  attr_reader :token

  def initialize(host = '127.0.0.1', token = '123')
    @host  = host
    @token = token
  end

  %w(get post patch put delete).each do |http_method|
    define_method(http_method) do |path, payload = {}|
      process(http_method, path, payload)
    end
  end

  protected

  def process(method, path, payload = {})
    res = connection.send(method, path) do |req|
      req.headers['X-AUTH-TOKEN'] = token
      req.body = to_json(payload)
    end

    process_response(res)
  rescue Faraday::ClientError => e
    raise ::PulseClient::ConnectionError, e.message
  end

  def process_response(res)
    status_body = "#{res.status}:#{res.body}"

    if res.status >= 200 && res.status < 300
      from_json(res.body)
    elsif res.status >= 300 && res.status < 400
      raise ::PulseClient::RedirectionError, status_body
    elsif res.status == 401
      raise ::PulseClient::UnauthorizedError, status_body
    elsif res.status == 404
      raise ::PulseClient::NotFoundError, status_body
    elsif res.status >= 400 && res.status < 500
      raise ::PulseClient::ClientError, status_body
    elsif res.status >= 500
      raise ::PulseClient::ServerError, status_body
    else
      # This should be an edge-case. All known statuses should be handled.
      fail status_body
    end
  end

  def connection
    @connection ||= ::Faraday.new(
      url: "https://#{host}:5531",
      ssl: { verify: false }
    )
  end

  def to_json(data)
    JSON.dump(data)
  end

  def from_json(data)
    JSON.parse(data)
  rescue JSON::ParserError
    data
  end
end
