# frozen_string_literal: true
# test_server.rb

# require the necessary libraries
require 'rack/test'
require_relative 'api'

# define the test case
class APITest < Minitest::Test
  # include the Rack::Test::Methods module to get access to the `get` and `last_response` methods
  include Rack::Test::Methods

  def app
    # return the Rack app (in this case, the API class)
    API.new
  end

  def test_hello_path
    # make a GET request to the /hello path
    get '/hello'

    # verify that the response has a 200 status code
    assert_equal 200, last_response.status

    # parse the JSON response body
    body = JSON.parse(last_response.body)

    # verify that the response body has the expected message
    assert_equal 'Hello, World!', body['message']
  end
end
