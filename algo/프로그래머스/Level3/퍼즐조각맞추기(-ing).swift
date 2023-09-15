//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/09/14.
//

import Foundation

func rotate(t: [(Int, Int)], size: Int) -> [[(Int, Int, Int)]] {
    var t = t.map { a in
        return (a.0, a.1, size)
    }

    var result = [t]

    for _ in 0..<3 {
        var tmp: [(Int, Int, Int)] = []
        for res in result.last! {
            let y = res.0
            let x = res.1
            tmp.append((-x, y, size))
        }
        result.append(tmp)
    }

    return result
}

func fit(board: [[Int]], piece: [(Int, Int, Int)], y: Int, x: Int) -> Bool {
    let n = board.count
    for p in piece {
        let ny = y + p.0
        let nx = x + p.1
        if 0 < ny || n >= ny || 0 < nx || n >= nx || board[ny][nx] == 1 {
            return false
        }
    }
    return true
}

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    let dy = [1, -1, 0, 0]
    let dx = [0, 0, 1, -1]

    let n = game_board.count

    var visited = Array(repeating: Array(repeating: false, count: n), count: n)


    func bfs(space: [(Int, Int)], y: Int, x: Int, board: [[Int]], type: Int) -> [(Int, Int)] {
        var space = space
        space.append((0, 0))
        var q = [(0, 0)]
        var qIndex = 0
        visited[y][x] = true

        while qIndex < q.count {
            let cury = q[qIndex].0
            let curx = q[qIndex].1
            qIndex += 1

            for i in 0..<4 {
                let ny = y + cury + dy[i]
                let nx = x + curx + dx[i]
                if 0..<n ~= ny && 0..<n ~= nx && !visited[ny][nx] && board[ny][nx] == type {
                    visited[ny][nx] = true
                    q.append((cury + dy[i], curx + dx[i]))
                    space.append((cury + dy[i], curx + dx[i]))
                }
            }
        }

        return space
    }


    var tmpPiece: [[[(Int, Int, Int)]]] = []

    for i in 0..<table.count {
        for j in 0..<table.count {
            if !visited[i][j] && table[i][j] == 1 {
                var piece = bfs(space: [], y: i, x: j, board: table, type: 1)
                let size = piece.count
                let r = rotate(t: piece, size: size)
                tmpPiece.append(r)
            }
        }
    }

    print(tmpPiece)
    print(tmpPiece.count)



    var pieceUsed = Array(repeating: false, count: tmpPiece.count)
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var result = 0

    for i in 0..<n {
        for j in 0..<n {

            if visited[i][j] || game_board[i][j] == 1 { continue }

            let spaces = bfs(space: [], y: i, x: j, board: game_board, type: 0)


        outer: for space in spaces {
                let cury = i + space.0
                let curx = j + space.1


                for k in 0..<tmpPiece.count {
                    if pieceUsed[k] {
                        continue
                    }

                    let size = tmpPiece[k][0][0].2

                    if size != spaces.count { continue }

                    for piece in tmpPiece[k] {
                        for p in piece {
                            if fit(board: game_board, piece: piece, y: cury, x: curx) {
                                result += spaces.count
                                pieceUsed[k] = true

                                break outer
                            }

                        }


                    }

                }
            }

        }
    }

    print(result)

    return result
}


solution(
    [[1,1,0,0,1,0],
     [0,0,1,0,1,0],
     [0,1,1,0,0,1],
     [1,1,0,1,1,1],
     [1,0,0,0,1,0],
     [0,1,1,1,0,0]],

    [[1,0,0,1,1,0],
     [1,0,1,0,1,0],
     [0,1,1,0,1,1],
     [0,0,1,0,0,0],
     [1,1,0,1,1,0],
     [0,1,0,0,0,0]]
)

//solution(
//    [[0,0,0],
//     [1,1,0],
//     [1,1,1]],
//
//    [[1,1,1],
//     [1,0,0],
//     [0,0,0]]
//)
