require 'json'

class CognitiveBias
  def initialize
    @biases = JSON.parse(File.open('cognitive_bias.json', 'r').read)
  end

  def bias_information
    bias = read_input
    while bias != 42
      if (1..4).cover?(bias)
        bias_node = @biases['children'][bias - 1]
        puts "Bias name: #{bias_node['name']}"
        bias_node['children'].each { |bias_child| puts bias_child['name'] }
      else
        puts 'Your option is unacceptable.'
      end

      bias = read_input
      puts
    end

    puts 'Visit https://en.wikipedia.org/wiki/Cognitive_bias for more!'
  end

  private

  def read_input
    puts 'Select a bias number to learn more about it:'
    puts
    @biases['children'].each { |bias| puts bias['name'] }
    puts 'Press 42 to exit'
    option = gets

    option.to_i
  end
end

CognitiveBias.new.bias_information
