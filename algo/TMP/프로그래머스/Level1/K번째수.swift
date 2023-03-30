//
//  K번째수.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42748
//  Created by 김민재 on 2022/08/08.
//

import Foundation


func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var arr = array
    var result = [Int]()
    
    for command in commands {
        let i = command[0] - 1
        let j = command[1] - 1
        let k = command[2] - 1
        
        arr = Array(arr[i...j])
        arr.sort()
        result.append(arr[k])
        arr = array
    }
    
    return result
}
/*
 테스트 1 〉    통과 (0.16ms, 16.4MB)
 테스트 2 〉    통과 (0.19ms, 16.5MB)
 테스트 3 〉    통과 (0.18ms, 16.4MB)
 테스트 4 〉    통과 (0.17ms, 16.5MB)
 테스트 5 〉    통과 (0.13ms, 16.5MB)
 테스트 6 〉    통과 (0.19ms, 16.8MB)
 테스트 7 〉    통과 (0.19ms, 16.7MB)
 */

func betterSolution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { key in
        array[key[0]-1...key[1]-1].sorted()[key[2]-1]
    }
}

/*
 테스트 1 〉    통과 (0.14ms, 16.3MB)
 테스트 2 〉    통과 (0.15ms, 16.3MB)
 테스트 3 〉    통과 (0.16ms, 16.3MB)
 테스트 4 〉    통과 (0.12ms, 16.4MB)
 테스트 5 〉    통과 (0.10ms, 16.4MB)
 테스트 6 〉    통과 (0.11ms, 16.4MB)
 테스트 7 〉    통과 (0.11ms, 16.5MB)
 */


betterSolution([1, 5, 2, 6, 3, 7, 4]    , [[2, 5, 3], [4, 4, 1], [1, 7, 3]]    )
