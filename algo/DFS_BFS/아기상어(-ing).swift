//
//  아기상어.swift
//  algo
//
//  Created by 김민재 on 2023/06/07.
//

import Foundation

func drawMap() {
    for i in 0..<N {
        for j in 0..<N {
            print(map[i][j], terminator: " ")
        }
        print("")
    }
}

let N = Int(readLine()!)!

var map: [[Int]] = []
var sharkPos = (0, 0)

for i in 0..<N {
    let state = readLine()!.split(separator: " ").map({ Int($0)! })
    map.append(state)
    for j in 0..<state.count {
        if state[j] == 9 {
            sharkPos = (i, j)
        }
    }
}

// bfs로 최단거리 찾기


var queue: [(Int, Int)] = []
var qIndex = 0

while qIndex < queue.count {

}
