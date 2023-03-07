# frozen_string_literal: true
require 'rack'

class MyRackApp
  # def call(env)
  #   [200, { 'Content-type' => 'text/plain' }, ["Welcome to Rack!"]]
  # end

  run -> (env) { [200, { "Content-Type" => "text/html" }, ["<html><body>", "<h1>Hello from Ruby!</h1>", "</body></html>"]] }

end

app = MyRackApp.new
run app