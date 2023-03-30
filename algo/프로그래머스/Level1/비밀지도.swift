//
//  비밀지도.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/17681?language=swift
//  Created by 김민재 on 2022/08/10.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        var str = String(arr1[i] | arr2[i], radix: 2)
        while str.count != n {
            str.insert("0", at: str.startIndex)
        }
        
        str = str.replacingOccurrences(of: "1", with: "#").replacingOccurrences(of: "0", with: " ")
        answer.append(str)
    }
    
    return answer
}

/*
 
 테스트 1 〉    통과 (0.30ms, 16.6MB)
 테스트 2 〉    통과 (0.59ms, 16.5MB)
 테스트 3 〉    통과 (0.19ms, 16.6MB)
 테스트 4 〉    통과 (0.33ms, 16.7MB)
 테스트 5 〉    통과 (0.25ms, 16.4MB)
 테스트 6 〉    통과 (0.40ms, 16.7MB)
 테스트 7 〉    통과 (0.24ms, 16.6MB)
 테스트 8 〉    통과 (0.22ms, 16.6MB)
 */

func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        var str = String(arr1[i] | arr2[i], radix: 2)
        if str.count < n {
            str = String(repeating: "0", count: n - str.count) + str
        }
        
        let ans = str.map {
            $0 == "1" ? "#" : " "
        }.joined()
        
        answer.append(ans)
    }
    
    return answer
}

/*
 테스트 1 〉    통과 (0.06ms, 16.4MB)
 테스트 2 〉    통과 (0.10ms, 16.2MB)
 테스트 3 〉    통과 (0.05ms, 16.2MB)
 테스트 4 〉    통과 (0.07ms, 16.4MB)
 테스트 5 〉    통과 (0.06ms, 16.3MB)
 테스트 6 〉    통과 (0.07ms, 16.4MB)
 테스트 7 〉    통과 (0.06ms, 16.4MB)
 테스트 8 〉    통과 (0.05ms, 16.5MB)
 */

solution2(6, [46, 33, 33 ,22, 31, 50]
, [27 ,56, 19, 14, 14, 10]
)
