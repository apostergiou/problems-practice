require "rack"

class RackPlay
  def call(env)
    request = Rack::Request.new(env)
    http_verb = request.request_method

    [200, {}, ["hello, verb: #{http_verb}\n"]]
  end
end

# Start the WEBrick server: `$ ruby rack_play.rb`
# Send a request with `$ curl -X GET localhost:9099`
# => hello, verb: GET
Rack::Handler::WEBrick.run(RackPlay.new, Port: 9099)
