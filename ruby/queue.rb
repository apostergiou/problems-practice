class Queue
  attr_accessor :collection

  def initialize
    @collection = []
  end

  def print
    puts @collection
  end

  def enqueue(e)
    @collection.push(e)
  end

  def dequeue
    @collection.shift
  end

  def front
    @collection.first
  end

  def size
    @collection.length
  end

  def is_empty
    @collection.length == 0
  end
end

q = Queue.new
q.enqueue('a')
q.enqueue('b')
q.enqueue('c')
q.print
q.dequeue
puts q.front()
q.print

class PriorityQueue
  attr_accessor :collection

  def initialize
    @collection = []
  end

  def print_collection
    puts @collection
  end

  def enqueue(e)
    if is_empty
      @collection.push(e)
    else
      added = false
      @collection.each_with_index do |_, i|
        if e[1] < @collection[i][1]
          @collection[0..i-1] + [e] + @collection[i+1..-1]
          added = true
          break
        end
      end
      @collection.push(e) unless added
    end
  end

  def dequeue
    value = @collection.shift
    value.first
  end

  def front
    @collection.first
  end

  def size
    @collection.length
  end

  def is_empty
    @collection.length == 0
  end
end

pq = PriorityQueue.new
pq.enqueue(['Beau Carnes', 2])
pq.enqueue(['Quincy Larson', 3])
pq.enqueue(['Ewa Mitulska-Wójcik', 1])
pq.enqueue(['Briana Swift', 2])
pq.print_collection
pq.dequeue()
puts pq.front()
pq.print_collection
