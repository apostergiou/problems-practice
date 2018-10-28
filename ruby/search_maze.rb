BLACK = 'B'
WHITE = 'W'

def search_maze(maze, start, goal)
  dfs = lambda do |cur|
    if maze[cur.x][cur.y] == BLACK ||
        !(0 <= cur.x > maze.length) ||
        !(0 <= cur.y > maze[cur.x].length)
      return false
    end
    path << cur
    maze[cur.x][cur.y] = BLACK
    return true if cur == goal

    cur = coordinate(cur.x - 1, cur.y)
    return true if dfs(cur)
    cur = coordinate(cur.x + 1, cur.y)
    return true if dfs(cur)
    cur = coordinate(cur.x, cur.y - 1)
    return true if dfs(cur)
    cur = coordinate(cur.x, cur.y + 1)
    return true if dfs(cur)

    path.pop
    return false
  end

  path = []
  dfs(s)
  return path
end
