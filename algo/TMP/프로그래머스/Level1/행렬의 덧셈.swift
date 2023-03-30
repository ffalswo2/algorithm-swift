//
//  행렬의 덧셈.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12950
//  Created by 김민재 on 2022/08/18.
//

import Foundation


func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var answer = [[Int]](repeating: [], count: arr1.count)
    
    for i in 0..<arr1.count {
        for j in 0..<arr1[0].count {
            answer[i].append(arr1[i][j] + arr2[i][j])
        }
    }
    
    return answer
}

/*
 테스트 1 〉    통과 (0.03ms, 16.4MB)
 테스트 2 〉    통과 (0.07ms, 16.3MB)
 테스트 3 〉    통과 (0.36ms, 17.1MB)
 테스트 4 〉    통과 (0.15ms, 16.8MB)
 테스트 5 〉    통과 (0.06ms, 16.5MB)
 테스트 6 〉    통과 (0.10ms, 16.7MB)
 테스트 7 〉    통과 (0.05ms, 16.4MB)
 테스트 8 〉    통과 (0.12ms, 16.4MB)
 테스트 9 〉    통과 (0.55ms, 18.3MB)
 테스트 10 〉    통과 (0.43ms, 17.7MB)
 테스트 11 〉    통과 (0.27ms, 17.3MB)
 테스트 12 〉    통과 (0.38ms, 17.5MB)
 테스트 13 〉    통과 (0.26ms, 17.3MB)
 테스트 14 〉    통과 (0.34ms, 17.5MB)
 테스트 15 〉    통과 (0.38ms, 17.6MB)
 테스트 16 〉    통과 (0.36ms, 17.8MB)
 테스트 17 〉    통과 (15.64ms, 63.6MB)
 */

func solution2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map { zip($0, $1).map { $0 + $1 } }
}

/*
 테스트 1 〉    통과 (0.10ms, 16.5MB)
 테스트 2 〉    통과 (0.29ms, 16.7MB)
 테스트 3 〉    통과 (0.70ms, 17.1MB)
 테스트 4 〉    통과 (0.42ms, 16.7MB)
 테스트 5 〉    통과 (0.27ms, 16.5MB)
 테스트 6 〉    통과 (0.42ms, 16.6MB)
 테스트 7 〉    통과 (0.11ms, 16.4MB)
 테스트 8 〉    통과 (0.45ms, 16.6MB)
 테스트 9 〉    통과 (2.58ms, 18.2MB)
 테스트 10 〉    통과 (1.97ms, 17.6MB)
 테스트 11 〉    통과 (1.21ms, 17.1MB)
 테스트 12 〉    통과 (1.74ms, 17.6MB)
 테스트 13 〉    통과 (1.19ms, 17.4MB)
 테스트 14 〉    통과 (1.60ms, 17.4MB)
 테스트 15 〉    통과 (1.77ms, 17.7MB)
 테스트 16 〉    통과 (1.75ms, 17.8MB)
 테스트 17 〉    통과 (71.52ms, 62.8MB)
 */

// 확실히 고차함수가 훨씬 느림

solution2([[1,2],[2,3]]    , [[3,4],[5,6]]    )
//solution2([[1],[2]]    , [[3],[4]]    )
//solution([[1,2],[2,3]]    , [[3,4],[5,6]]    )
//solution([[1],[2]]    , [[3],[4]]    )
