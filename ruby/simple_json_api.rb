require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'httparty'
end

require 'json'

server_raw_output = HTTParty.get('https://talaikis.com/api/quotes/random/').body
quote_hash = JSON.parse(server_raw_output)
puts quote_hash['author'] + ': ' + quote_hash['quote']
