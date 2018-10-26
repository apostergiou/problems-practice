class Set
  attr_accessor :collection

  def initialize
    @collection = []
  end

  def has(e)
    @collection.include?(e)
  end

  def values
    @collection
  end

  def add(e)
    if !has(e)
      @collection.push(e)
      return true
    end
    false
  end

  def remove(e)
    if has(e)
      @collection - [e]
      return true
    end
    false
  end

  def size
    @collection.length
  end

  def union(other_set)
    union_set = Set.new
    first_set = values
    second_set = other_set.values

    first_set.each { |e| union_set.add(e) }
    second_set_set.each { |e| union_set.add(e) }

    union_set
  end

  def intersection(other_set)
    intersection_set = Set.new
    first_set = values
    first_set.each do |e|
      intersection_set.add(e) if other_set.has(e)
    end

    intersection_set
  end

  def difference(other_set)
    difference_set = Set.new
    first_set = values
    first_set.each do |e|
      difference_set.add(e) unless other_set.has(e)
    end

    difference_set
  end

  def subset(other_set)
    first_set = values
    first_set.each do |v|
      return false unless other_set.has(v)
    end
    true
  end
end

set1 = Set.new
set2 = Set.new
set1.add('a')
set2.add('b')
set2.add('c')
set2.add('a')
set2.add('d')
puts set1.subset(set2)
puts set1.intersection(set2).values
puts set2.difference(set1).values

set3 = Set.new
set4 = Set.new
set3.add('a')
set4.add('b')
set4.add('c')
set4.add('a')
set4.add('d')
puts set4.values
set4.remove('a')
puts set4.has('a')
puts set4.add('d')
