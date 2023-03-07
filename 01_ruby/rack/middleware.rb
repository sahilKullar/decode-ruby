# middleware.rb

# require the necessary libraries
require 'rack'

# define the Rack middleware app
class Middleware
  # initialize the app and pass in the main app
  def initialize(app)
    @app = app
  end

  # implement the call method required by Rack
  def call(env)
    # perform some processing on the request before passing it to the main app
    puts "Processing request before passing it to the main app..."

    # call the main app and get the response
    status, headers, body = @app.call(env)

    # perform some processing on the response before returning it
    puts "Processing response before returning it to the client..."

    # return the response
    [status, headers, body]
  end
end

# define the main app
class App
  # implement the call method required by Rack
  def call(env)
    # set the response header content type to HTML
    header = { 'Content-Type' => 'text/html' }

    # set the response body to an HTML page
    body = ["<html><body><h1>Hello, World!</h1></body></html>"]

    # return the response as an array with the status code, header, and body
    [200, header, body]
  end
end

# create an instance of the main app
app = App.new

# use the Middleware app as the Rack middleware using Rack::Builder
use Rack::Builder do
  use Middleware
  run app
end

# start the Rack server with the main app as the Rack app
Rack::Server.start app: app