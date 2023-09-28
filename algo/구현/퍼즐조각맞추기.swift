//
//  퍼즐조각맞추기.swift
//  algo
//
//  Created by 김민재 on 9/27/23.
//

import Foundation

func rotate(sp: [[Int]]) -> [[Int]] {
    var tmp = sp

    for i in 0..<sp.count {
        for j in 0..<sp.count {
            tmp[i][sp.count - j - 1] = sp[j][i]
        }
    }
    return tmp

}


func isFit(sp: [(Int, Int)], piece: [(Int, Int)]) -> Bool {
    var tmp = Array(repeating: Array(repeating: 0, count: 10), count: 10)

    var startY = tmp.count / 2

    for s in sp {
        tmp[s.0 + startY][s.1 + startY] = 1
    }


    for _ in 0..<4 {
        tmp = rotate(sp: tmp)

    check: for i in 0..<tmp.count {
            for j in 0..<tmp.count {
                if tmp[i][j] == 1 {
                    var flag = true
                    for p in piece {
                        if tmp[p.0 + i][p.1 + j] == 0 {
                            flag = false
                            break check
                        }
                    }

                    if flag {
                        return true
                    }
                }
            }

        }
    }


    return false
}


func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {

    let n = game_board.count

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)


    var spaces: [[(Int, Int)]] = [] // game_board 빈칸 정보 찾기
    var pieces: [[(Int, Int)]] = [] // table 조각 정보 찾기

    let dy = [1, -1, 0, 0]
    let dx = [0, 0, 1, -1]

    func bfs(board: [[Int]], y: Int, x: Int, type: Int) -> [(Int, Int)] {
        
        var space: [(Int, Int)] = [(0, 0)]
        var q = [(0, 0)]
        visited[y][x] = true
        var qIndex = 0


        while qIndex < q.count {
            let cury = q[qIndex].0
            let curx = q[qIndex].1
            qIndex += 1

            for i in 0..<4 {
                let ny = y + cury + dy[i]
                let nx = x + curx + dx[i]

                if 0..<n ~= ny && 0..<n ~= nx && !visited[ny][nx] && board[ny][nx] == type {
                    visited[ny][nx] = true
                    q.append((ny - y, nx - x))
                    space.append((ny - y, nx - x))
                }
            }

        }

        return space
    }

    
    for i in 0..<n {
        for j in 0..<n {
            if game_board[i][j] == 0 && !visited[i][j] {
                let sp = bfs(board: game_board, y: i, x: j, type: 0)
                spaces.append(sp)
            }
        }
    }
    // game_table에서 빈칸 다 찾음

    visited = Array(repeating: Array(repeating: false, count: n), count: n)

    for i in 0..<n {
        for j in 0..<n {
            if table[i][j] == 1 && !visited[i][j] {
                let piece = bfs(board: table, y: i, x: j, type: 1)
                pieces.append(piece)
            }
        }
    }
    // table에서 조각 다 찾음

    var answer = 0
    var spaceFilled = Array(repeating: false, count: spaces.count)
    var pieceUsed = Array(repeating: false, count: pieces.count)

    for sIdx in 0..<spaces.count {
        let space = spaces[sIdx]

        for pIdx in 0..<pieces.count {
            let piece = pieces[pIdx]
            if space.count != piece.count || spaceFilled[sIdx] || pieceUsed[pIdx] { continue }

            if isFit(sp: space, piece: piece) {
                spaceFilled[sIdx] = true
                pieceUsed[pIdx] = true
                answer += space.count
            }
        }
    }

    return answer
}


solution([[1,1,0,0,1,0],[0,0,1,0,1,0],[0,1,1,0,0,1],[1,1,0,1,1,1],[1,0,0,0,1,0],[0,1,1,1,0,0]]    ,
         [[1,0,0,1,1,0],[1,0,1,0,1,0],[0,1,1,0,1,1],[0,0,1,0,0,0],[1,1,0,1,1,0],[0,1,0,0,0,0]]    )
