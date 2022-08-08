//
//  main.swift
//  로또의 최고 순위와 최저 순위
//  https://school.programmers.co.kr/learn/courses/30/lessons/77484?language=swift
//  Created by 김민재 on 2022/08/06.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var correctCnt = 0
    var zeroCnt = 0
    
    for lot in lottos {
        if lot == 0 {
            zeroCnt += 1
        }
        
        if win_nums.contains(lot) {
            correctCnt += 1
        }
    }
    
    var result: [Int] = []
    let scores = [correctCnt+zeroCnt, correctCnt]
    
    for var score in scores {
        switch score {
        case 2:
            score = 5
        case 3:
            score = 4
        case 4:
            score = 3
        case 5:
            score = 2
        case 6:
            score = 1
        default:
            score = 6
        }
        result.append(score)
    }
    
    
    return result
}

solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25])
