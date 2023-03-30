//
//  소수만들기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12977?language=swift
//  Created by 김민재 on 2022/08/07.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    func isPrime(num: Int) -> Bool {
        for i in 2..<num {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
    
    func betterPrime(num: Int) -> Bool {
        
        for i in 2..<(Int(sqrt(Double(num))) + 1) {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
    
    var answer = 0
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                if betterPrime(num: (nums[i] + nums[j] + nums[k])) {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}
/*
테스트 1 〉    통과 (0.74ms, 16.4MB)
테스트 2 〉    통과 (1.10ms, 16.6MB)
테스트 3 〉    통과 (0.37ms, 16.2MB)
테스트 4 〉    통과 (0.23ms, 16.4MB)
테스트 5 〉    통과 (1.15ms, 16.3MB)
테스트 6 〉    통과 (8.38ms, 16.4MB)
테스트 7 〉    통과 (0.26ms, 16.5MB)
테스트 8 〉    통과 (25.35ms, 16.4MB)
테스트 9 〉    통과 (1.33ms, 16.4MB)
테스트 10 〉    통과 (14.80ms, 16.5MB)
테스트 11 〉    통과 (0.05ms, 16.5MB)
테스트 12 〉    통과 (0.03ms, 16.2MB)
테스트 13 〉    통과 (0.05ms, 16.2MB)
테스트 14 〉    통과 (0.03ms, 16.3MB)
테스트 15 〉    통과 (0.04ms, 16.5MB)
테스트 16 〉    통과 (61.25ms, 16.2MB)
테스트 17 〉    통과 (0.87ms, 16.2MB)
테스트 18 〉    통과 (0.53ms, 16.4MB)
테스트 19 〉    통과 (0.06ms, 16.4MB)
테스트 20 〉    통과 (80.56ms, 16.4MB)
테스트 21 〉    통과 (59.14ms, 16.3MB)
테스트 22 〉    통과 (0.18ms, 16.6MB)
테스트 23 〉    통과 (0.01ms, 16.5MB)
테스트 24 〉    통과 (48.87ms, 16.3MB)
테스트 25 〉    통과 (48.14ms, 16.5MB)
테스트 26 〉    통과 (0.02ms, 16.3MB)
*/

/*
 테스트 1 〉    통과 (0.34ms, 16.3MB)
 테스트 2 〉    통과 (0.51ms, 16.5MB)
 테스트 3 〉    통과 (0.15ms, 16.4MB)
 테스트 4 〉    통과 (0.08ms, 16.4MB)
 테스트 5 〉    통과 (0.70ms, 16.1MB)
 테스트 6 〉    통과 (1.54ms, 16.4MB)
 테스트 7 〉    통과 (0.08ms, 16.3MB)
 테스트 8 〉    통과 (2.93ms, 16.4MB)
 테스트 9 〉    통과 (0.28ms, 16.4MB)
 테스트 10 〉    통과 (2.32ms, 16.2MB)
 테스트 11 〉    통과 (0.04ms, 16.4MB)
 테스트 12 〉    통과 (0.03ms, 16.5MB)
 테스트 13 〉    통과 (0.05ms, 16.3MB)
 테스트 14 〉    통과 (0.03ms, 16.5MB)
 테스트 15 〉    통과 (0.03ms, 16.4MB)
 테스트 16 〉    통과 (2.46ms, 16.3MB)
 테스트 17 〉    통과 (0.99ms, 16.3MB)
 테스트 18 〉    통과 (0.05ms, 16.3MB)
 테스트 19 〉    통과 (0.02ms, 16.4MB)
 테스트 20 〉    통과 (3.47ms, 16.3MB)
 테스트 21 〉    통과 (2.98ms, 16.2MB)
 테스트 22 〉    통과 (0.20ms, 16.6MB)
 테스트 23 〉    통과 (0.02ms, 16.5MB)
 테스트 24 〉    통과 (3.15ms, 16.3MB)
 테스트 25 〉    통과 (3.00ms, 16.4MB)
 테스트 26 〉    통과 (0.02ms, 16.3MB)
 */


solution([1,2,7,6,4])
