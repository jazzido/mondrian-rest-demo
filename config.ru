require 'bundler'
Bundler.setup

require 'rack/config'
require 'rack/cors'
require 'logger'

require 'mondrian_rest'

logger = Logger.new(STDERR)
logger.level = Logger::DEBUG

catalog = File.join(File.dirname(__FILE__), 'schema.xml')

require_relative './drivers/monetdb-jdbc-2.18.jar'
Java::nl.cwi.monetdb.jdbc.MonetDriver

PARAMS = {
  driver: 'jdbc',
  jdbc_driver: 'nl.cwi.monetdb.jdbc.MonetDriver',
  jdbc_url: "jdbc:monetdb://localhost:50000/oec",
  username: 'monetdb',
  password: 'monetdb',
  catalog: catalog
}

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

use Rack::Config do |env|
  env['mondrian-olap.params'] = PARAMS
end

run Mondrian::REST::Api
