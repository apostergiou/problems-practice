# left child: i * 2
# right child: i * 2 + 1
# parent: i / 2

class MinHeap
  attr_accessor :elements, :element_position_map

  def initialize
    @elements = [nil]
    @element_position_map = Hash.new
  end

  def <<(element)
    @elements << element
    @element_position_map[element.node_data] = @elements.size - 1

    sift_up(@elements.size - 1)
  end

  def extract_min
    exchange(1, @elements.size - 1)
    min_element = @elements.pop
    @element_position_map.delete(min_element.node_data)
    sift_down(1)

    return min_element
  end

  def delete_element(element)
    element_position = @element_position_map[element.node_data]
    unless element_position.nil?
      exchange(element_position, @elements.size - 1)
      min_element = @elements.pop
      @element_position_map.delete(min_element.node_data)
      sift_down(element_position)

      return min_element
    end
  end
end
