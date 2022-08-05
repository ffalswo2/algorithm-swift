//
//  2022 KAKAO BLIND RECRUITMENT - 신고결과받기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/92334?language=swift
//  Created by 김민재 on 2022/08/05.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportDict: [String: Set<String>] = [:]
    var indexDict: [String: Int] = [:]
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    
    for (index, id) in id_list.enumerated() {
        indexDict[id] = index
    }
    
    for rep in report {
        let s = rep.split(separator: " ")
        let reporter = String(s[0])
        let reported = String(s[1])
        
        if let _ = reportDict[reported] {
            reportDict[reported]!.insert(reporter)
        } else {
            reportDict[reported] = [reporter]
        }
    }
    
    for (_, value) in reportDict {
        if value.count >= k {
            
            for id in value {
                result[indexDict[id]!] += 1
            }
        }
    }
    
    return result
}

let answer = solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)

print(answer)

