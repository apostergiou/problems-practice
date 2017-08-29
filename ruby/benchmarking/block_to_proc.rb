require 'benchmark/ips'

class CustomCollection
  def initialize(collection)
    @collection = collection
  end

  def block
    @collection.map(&:to_s)
  end

  def block_to_proc
    @collection.map { |i| i.to_s }
  end
end

Benchmark.ips do |x|
  collection = CustomCollection.new(1..100)

  x.report 'block' do
    collection.block
  end

  x.report 'block to proc' do
    collection.block_to_proc
  end

  x.compare!
end

<<-DOC
Warming up --------------------------------------
               block
     6.784k i/100ms
       block to proc     6.014k i/100ms
Calculating -------------------------------------
               block     69.994k (± 4.8%) i/s -    352.768k in   5.052372s
       block to proc     61.122k (± 3.4%) i/s -    306.714k in   5.024221s

Comparison:
               block:    69994.2 i/s
       block to proc:    61122.5 i/s - 1.15x  slower
DOC
