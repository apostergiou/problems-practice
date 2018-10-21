require 'httparty'

class QuoteConnector
  URL = 'https://talaikis.com/api/quotes/random/'.freeze

  def initialize(adapter: HTTParty)
    @adapter = adapter
  end

  def call
    adapter.get(URL).body
  end

  private

  attr_reader :adapter
end

