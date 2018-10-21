class QuoteParser
  def initialize(object_to_parse:, parser_class: JSON)
    @object_to_parse = object_to_parse
    @parser_class = parser_class
  end

  def call
    parser_class.parse(object_to_parse)
  end

  private

  attr_reader :object_to_parse, :parser_class
end
