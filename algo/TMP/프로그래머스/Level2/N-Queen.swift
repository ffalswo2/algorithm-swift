//
//  N-Queen.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12952
//  Created by 김민재 on 2022/08/29.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var col = [Int](repeating: -1, count: n)
    var answer = 0
    
    func check(_ y: Int, _ x: Int) -> Bool {
        for i in 0..<y {
            // 세로 || 대각선 ( x절댓값 차 == y 절댓값 차 )
            if col[i] == x || abs(y - i) == abs(x - col[i]) { return false }
        }
        return true
    }
    
    func bt(_ depth: Int) {
        if depth == n {
            answer += 1
            return
        }
        
        for i in 0..<n {
            if check(depth, i) { // 갈수 있으면
                col[depth] = i // 방문
                bt(depth + 1)
                col[depth] = -1 // 나와서는 다시 방문처리를 해제시켜주어야 다음에 다시 방문 가능함
            }
            // 조건에 해당이 안되면 애초에 더 깊이 안들어감 (백트래킹)
        }
    }
    
    bt(0)
    return answer
}


solution(4)
