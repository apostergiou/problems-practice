class LinkedList
  attr_accessor :length, :head

  def initialize
    @length = 0
    @head = nil
  end

  def size
    length
  end

  def add(e)
    node = Node.new(e)
    if @head == nil
      @head= node
    else
      current_node = head

      while current_node.next do
        current_node = current_node.next
      end

      current_node.next = node
    end

    @length += 1
  end

  def remove(e)
    current_node = @head
    if current_node.element == e
      @head = current_node.next
    else
      while current_node.element != e do
        previous_node = current_node
        current_node = current_node.next
      end

      previous_node.next = current_node.next
    end

    @length -= 1
  end

  def is_empty?
    @length == 0
  end

  def index_of(e)
    current_node = @head
    index = -1

    while current_node
      index += 1
      return index if current_node.element == e
      current_node = current_node.next
    end

    -1
  end

  def element_at(i)
    current_node = @head
    count = 0
    while count < i
      count += 1
      current_node = current_node.next
    end

    current_node.element
  end

  def add_at(i, e)
    node = Node.new(e)

    current_node = @head
    current_index = 0

    return false if i > @length

    if i == 0
      node.next = current_node
      @head = node
    else
      while (current_index < i)
        current_index += 1
        previous_node = current_node
        current_node = current_node.next
      end

      node.next = current_node
      previous_node.next = node
    end

    @length += 1
  end

  def remove_at(i)
    current_node = @head
    current_index = 0
    if i < 0 || i >= @length
      return nil
    end

    if i == 0
      @head = current_node.next
    else
      while current_index < i
        current_index += 1
        previous_node = current_node
        current_node = current_node.next
      end
      previous_node.next = current_node.next
    end

    @length -= 1
    current_node.element
  end
end

class Node
  attr_accessor :element, :next

  def initialize(e)
    @element = e
    @next = nil
  end
end

conga = LinkedList.new;
conga.add('Kitten');
conga.add('Puppy');
conga.add('Dog');
conga.add('Cat');
conga.add('Fish');
puts conga.size();
puts conga.remove_at(3);
puts conga.element_at(3);
puts conga.index_of('Puppy');
puts conga.size();
