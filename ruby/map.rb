class Map
  attr_accessor :collection, :count

  def initialize
    @collection = {}
    @count = 0
  end

  def size; @count end

  def set(k, v)
    @collection[k] = v
    @count += 1
  end

  def has(k)
    @collection[k].nil? ? false : true
  end

  def get(k); @collection[k] end

  def delete(k)
    @collection.delete(k)
    count -= 1
  end

  def values
    result = []
    @collection.each do |k, v|
      result << v
    end
    result.empty? ? nil : result
  end

  def clear
    @collection = {}
    @count = 0
  end
end

map1 = Map.new
map1.set('arms', 2)
map1.set('fingers', 10)
map1.set('eyes', 2)
map1.set('belley button', 1)

puts map1.get('fingers')
puts map1.size
puts map1.values
