require 'bundler'
Bundler.setup

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

aggregator = Mondrian::REST::Server.instance
aggregator.params = PARAMS
aggregator.connect!

run Mondrian::REST::Api.new
