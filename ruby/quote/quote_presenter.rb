class QuotePresenter
  def initialize(quote_hash:)
    @quote_hash = quote_hash
  end

  def to_s
    "#{quote_hash['author']}: #{quote_hash['quote']}\n"
  end

  def present
    to_s
  end

  private

  attr_reader :quote_hash
end
