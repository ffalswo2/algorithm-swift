//
//  감시(2).swift
//  algo
//
//  Created by 김민재 on 9/27/23.
//

import Foundation

let dy = [-1, 0, 1, 0] // 상 우 하 좌
let dx = [0, 1, 0, -1]

var cameras: [(Int, Int, Int)] = [] // cctv카메라 좌표를 저장할 공간

var board: [[Int]] = []

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}


var answer = 0
var candidates = 1
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] >= 1 && board[i][j] < 6 {
            cameras.append((board[i][j], i, j))
            candidates *= 4
        } else if board[i][j] == 0 {
            answer += 1
        }
    }
}

var checkedAreaCnt = 0

func checkCamArea(board: inout [[Int]], y:Int, x: Int, dir: Int) {
    let dir = dir % 4

    var ny = y + dy[dir]
    var nx = x + dx[dir]

    while true {
        if ny < 0 || nx < 0 || ny >= n || nx >= m || board[ny][nx] == 6 { break }
        else if board[ny][nx] > 0 { continue }
        board[ny][nx] = -1 // # 표시 대신 -1
        checkedAreaCnt += 1

        ny += dy[dir]
        nx += dx[dir]
    }
}

for can in 0..<candidates {
    var initZeros = answer
    var tmpBoard = board
    
    var tmp = can
    for cIdx in 0..<cameras.count {
        let dir = tmp % 4
        tmp /= 4

        let camera = cameras[cIdx].0
        let y = cameras[cIdx].1
        let x = cameras[cIdx].2

        if camera == 1 {
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir)

        } else if camera == 2 {
            if dir == 2 || dir == 3 { continue }
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir)
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir + 2)

        } else if camera == 3 {
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir)
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir + 1)

        } else if camera == 4 {
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir)
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir + 1)
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir + 2)
        } else if camera == 5 {
            if dir != 0 { continue }
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir)
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir + 1)
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir + 2)
            checkCamArea(board: &tmpBoard, y: y, x: x, dir: dir + 3)
        }

    }

    var zeroCnt = 0
    for i in 0..<n {
        for j in 0..<m {
            if tmpBoard[i][j] == 0 {
                zeroCnt += 1
            }
        }
    }
    
    answer = min(answer, checkedAreaCnt)
    checkedAreaCnt = 0
}

print(answer)
