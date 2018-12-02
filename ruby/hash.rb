class HashTable
  attr_accessor :storage

  LIMIT = 4

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
      return
    else
      (0...@storage[index].length).each do |i|
        if @storage[index][i][0] == k
          @storage[index][i][1] = v
          return
        end
      end
    end
    @storage[index].push([k, v])
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
    (0...@storage[index].length).each do |i|
      if @storage[index][i][0] == k
        return @storage[index][i][1]
      end
    end
    nil
  end

  private

  def my_hash(s, max)
    h = 0
    (0...s.length).each do |i|
      h += s[i].ord
    end
    h % max
  end
end

ht = HashTable.new
ht.add('beau', 'person')
ht.add('fido', 'dog')
ht.add('rex', 'dinosaur')
ht.add('tux', 'penguin')
puts "searching for 'tux' -->" + ' ' + ht.lookup('tux').to_s
puts "searching for 'mux' -->" + ' ' + ht.lookup('mux').to_s
ht.print
