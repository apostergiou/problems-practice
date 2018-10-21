require 'minitest/autorun'
require_relative '../quote_connector'
require 'ostruct'

class DummyRequest
  def self.get(*)
    OpenStruct.new(body: 'test')
  end
end

class TestConnector < Minitest::Test
  def test_call
    connector = QuoteConnector.new(adapter: DummyRequest)
    assert_equal 'test', connector.call
  end
end
