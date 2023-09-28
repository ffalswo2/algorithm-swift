//
//  스티커 붙이기.swift
//  algo
//
//  Created by 김민재 on 9/28/23.
//

import Foundation

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // y
let m = input[1] // x
let k = input[2] // 스티커 개수

var notebook = Array(repeating: Array(repeating: 0, count: m), count: n)

var stickers: [[(Int, Int)]] = []

for _ in 0..<k {
    var stickerBoard: [[Int]] = []

    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let sn = input[0]
    let sm = input[1]

    for _ in 0..<sn {
        let sinput = readLine()!.split(separator: " ").map { Int($0)! }
        stickerBoard.append(sinput)
    }

    var visited = Array(repeating: Array(repeating: false, count: sm), count: sn)

    func bfs(board: [[Int]], y: Int, x: Int) {

        var sticker: [(Int, Int)] = [(0, 0)]
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

                if 0..<sn ~= ny && 0..<sm ~= nx &&
                    !visited[ny][nx] && board[ny][nx] == 1 {
                    visited[ny][nx] = true
                    q.append((ny - y, nx - x))
                    sticker.append((ny - y, nx - x))
                }

            }
        }

        stickers.append(sticker)
    }




    for i in 0..<sn {
        for j in 0..<sm {
            if stickerBoard[i][j] == 1 && !visited[i][j] {
                bfs(board: stickerBoard, y: i, x: j)
            }
        }
    }
}
// 스티커 정보 넣기


func rotate(sticker: [(Int, Int)]) -> [(Int, Int)] {

    let n = 40
    var b = Array(repeating: Array(repeating: 0, count: n), count: n)

    let startY = b.count / 3

    for s in sticker {
        let y = startY + s.0
        let x = startY + s.1
        b[y][x] = 1
    }

//    //
//    for i in b {
//        for j in i {
//            print(j, terminator: " ")
//        }
//        print("")
//    }
//    print("---original----")
//    //

    let newY = b[0].count
    let newX = b.count
    var tmp = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<newY {
        for j in 0..<newX {

            tmp[i][b.count - j - 1] = b[j][i]

        }
    }

    //
//    for i in tmp {
//        for j in i {
//            print(j, terminator: " ")
//        }
//        print("")
//    }
//    print("---rotated----")
    //

    var visited = Array(repeating: Array(repeating: false, count: n), count: n)


    var sticker: [(Int, Int)] = [(0, 0)]
    func bfs(y: Int, x: Int) {

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

                if 0..<newY ~= ny && 0..<newX ~= nx &&
                    !visited[ny][nx] && tmp[ny][nx] == 1 {
                    visited[ny][nx] = true
                    q.append((ny - y, nx - x))
                    sticker.append((ny - y, nx - x))
                }

            }
        }

    }

    for i in 0..<n {
        for j in 0..<n {
            if tmp[i][j] == 1 {
                bfs(y: i, x: j)
            }
        }
    }


//    for s in sticker {
//        print(s)
//    }
//    print("sticker cooridnator !!")

    return sticker
}

func isFit(y: Int, x: Int, sticker: [(Int, Int)]) -> Bool {

    for s in sticker {
        let y = y + s.0
        let x = x + s.1

        if y < 0 || y >= n || x < 0 || x >= m {
            return false }
        else if notebook[y][x] == 1 {
            return false }
    }

    return true
}

func paste(board: inout [[Int]], y: Int, x: Int, sticker: [(Int, Int)]) {
    for s in sticker {
        let y = y + s.0
        let x = x + s.1
        board[y][x] = 1
    }
}


var answer = 0
for sticker in stickers {
    var sticker = sticker
sticker: for _ in 0..<4 {

//        print("trying to paste sticker !! !!!#R!#!# ")
//        print(sticker)

        for i in 0..<n {
            for j in 0..<m {
                if notebook[i][j] == 0 {
//                    for i in notebook {
//                        for j in i {
//                            print(j, terminator: " ")
//                        }
//                        print("")
//                    }
//                    print("----before paste notebook")
                    if isFit(y: i, x: j, sticker: sticker) {
//                        print("pasted !! ->>>>")
//                        print(sticker)
                        paste(board: &notebook, y: i, x: j, sticker: sticker)
//                        for i in notebook {
//                            for j in i {
//                                print(j, terminator: " ")
//                            }
//                            print("")
//                        }
//                        print("=-====note book pasted after ====")
                        answer += sticker.count
                        break sticker
                    }
                }
            }
        }

//    print(sticker)
    sticker = rotate(sticker: sticker)

    }
}

print(answer)
