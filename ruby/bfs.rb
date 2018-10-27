def bfs(graph, root)
  nodes_length = {}

  (0...graph.length).each do |i|
    nodes_length[i] = Float::INFINITY
  end
  nodes_length[root] = 0

  queue = [root]

  while queue.length > 0
    current = queue.shift

    cur_connected = graph[current]
    neighbor_idx = []
    idx = cur_connected.find_index(1)
    while idx != -1
      neighbor_idx << idx
      idx += 1
      next_idx = cur_connected[idx..-1].find_index(1)
      if next_idx.nil?
        idx = -1
      else
        idx = idx + next_idx
      end
    end

    (0..neighbor_idx.length).each do |i|
      if nodes_length[neighbor_idx[i]] == Float::INFINITY
        nodes_length[neighbor_idx[i]] = nodes_length[current] + 1
        queue << neighbor_idx[i]
      end
    end
  end

  return nodes_length
end

graph = [
  [0, 1, 1, 1, 0],
  [0, 0, 1, 0, 0],
  [1, 1, 0, 0, 0],
  [0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0]
]

puts bfs(graph, 1)
