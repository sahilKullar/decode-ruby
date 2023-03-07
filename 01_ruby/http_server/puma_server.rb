# server.rb

# require the necessary libraries
require 'rack'
require 'puma'
require 'json'

# define the API class
class API
  # implement the call method required by Rack
  def call(env)
    # set the response header content type to JSON
    header = { 'Content-Type' => 'application/json' }

    # set the response body to a JSON object
    body = { message: 'Hello, World!' }.to_json

    # return the response as an array with the status code, header, and body
    [200, header, [body]]
  end
end

# create an instance of the API class
app = API.new

# start the Puma server with the API instance as the Rack app
Puma::Server.new(app).tap do |s|
  s.add_tcp_listener '127.0.0.1', 4567
end.run.join