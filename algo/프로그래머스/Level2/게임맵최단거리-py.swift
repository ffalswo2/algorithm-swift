from collections import deque

def solution(maps):

    dy = [1,-1,0,0]
    dx = [0,0,-1,1]

    def bfs(y,x):

        queue = deque()
        queue.append((y, x))
        visited[y][x] = True

        while queue:
            y, x = queue.popleft()
            for i in range(4):
                ny = y + dy[i]
                nx = x + dx[i]

                if 0 <= ny < len(maps) and 0 <= nx < len(maps[0]) and visited[ny][nx] == False and maps[ny][nx] == 1:
                    visited[ny][nx] = True
                    maps[ny][nx] = maps[y][x] + 1
                    queue.append((ny, nx))

        return maps[len(maps)-1][len(maps[0])-1]

    visited = [[False] * len(maps[0]) for _ in range(len(maps))]

    answer = bfs(0,0)

    if answer == 1:
        return -1
    return answer


solution([[1,0,1,1,1],[1,0,1,0,1],[1,0,1,1,1],[1,1,1,0,1],[0,0,0,0,1]])
solution([[1,0,1,1,1],[1,0,1,0,1],[1,0,1,1,1],[1,1,1,0,0],[0,0,0,0,1]])
