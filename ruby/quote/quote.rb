require 'bundler/inline'
require 'httparty'
require 'json'

require_relative 'quote_connector'
require_relative 'quote_parser'
require_relative 'quote_presenter'

class Quote
  def initialize(connector: QuoteConnector,
                 parser: QuoteParser,
                 presenter: QuotePresenter)
    @connector = connector
    @parser = parser
    @presenter = presenter
  end

  def random_quote
    server_raw_output = connector.new.call
    quote_hash = parser.new(object_to_parse: server_raw_output).call
    presenter.new(quote_hash: quote_hash).present
  end

  private

  attr_reader :connector, :parser, :presenter
end

puts Quote.new.random_quote if $PROGRAM_NAME == __FILE__
