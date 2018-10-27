class Node
  attr_accessor :keys, :end

  def initialize
    @keys = {}
    @end = false
  end

  def set_end
    @end = true
  end

  def is_end
    @end
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = Node.new
  end

  def add(input, node = @root)
    if input.length == 0
      node.set_end
      return
    elsif node.keys[input[0]].nil?
      node.keys[input[0]] = Node.new
      return add(input[1..-1], node.keys[input[0]])
    else
      return add(input[1..-1], node.keys[input[0]])
    end
  end

  def is_word(word)
    node = @root
    while word.length > 1
      return false unless node.keys[word[0]]
      node = node.keys[word[0]]
      word = word[1..-1]
    end
    node.keys[word] && node.keys[word].is_end ? true : false
  end

  def print()
    words = []
    search = lambda do |node, string|
      if node.keys.size != 0
        node.keys.keys.each do |l|
          search.call(node.keys[l], string+l)
        end
        words << string if node.is_end
      else
        string.length > 0 ? words << string : nil
        return
      end
    end
    search.call(@root, '')
    words.length > 0 ? words : nil
  end
end

trie = Trie.new
trie.add('ball')
trie.add('bat')
trie.add('doll')
trie.add('dork')
trie.add('do')
trie.add('dorm')
trie.add('send')
trie.add('sense')
puts trie.is_word('doll')
puts trie.is_word('dor')
puts trie.is_word('dorf')
puts trie.print()
