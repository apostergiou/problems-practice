def my_hash(s, max)
  h = 0
  (0...s.length).each do |i|
    h += s[i].ord
  end
  h % max
end

class HashTable
  LIMIT = 4

  attr_accessor :storage

  def initialize
    @storage = []
  end

  def print
    puts @storage.inspect
  end

  def add(k, v)
    index = my_hash(k, LIMIT)
    if @storage[index].nil?
      @storage[index] = [[k, v]]
    else
      inserted = false
      (0...@storage[index].length).each do |i|
        if @storage[index][i][0] == k
          @storage[index][i][1] = v
          inserted = true
        end
      end
      if inserted == false
        @storage[index].push([k, v])
      end
    end
  end

  def remove(k)
    index = my_hash(k, LIMIT)
    if @storage[index].length == 1 && @storage[index][0][0] == key
      @storage.delete_at(index)
      return
    end
    (0..@storage[index]).each do |i|
      if @storage[index][i][0] == key
        @storage[index].delete_at[i]
      end
    end
  end

  def lookup(k)
    index = my_hash(k, LIMIT)
    return nil if (@storage[index] == nil)
    (0..@storage.length).each do |i|
      if @storage[index][i][0] == k
        return @storage[index][i][1]
      end
    end
  end
end

puts my_hash('quincy', 10)

ht = HashTable.new
ht.add('beau', 'person')
ht.add('fido', 'dog')
ht.add('rex', 'dinosaur')
ht.add('tux', 'penguin')
puts ht.lookup('tux')
ht.print
