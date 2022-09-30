//
//  조이스틱.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42860
//  Created by 김민재 on 2022/09/27.
//

import Foundation

func solution(_ name:String) -> Int {
    let name = Array(name)
    
    var updown = 0
    var answer = name.count
    for i in 0..<name.count {
        let asc = name[i].asciiValue! - Character("A").asciiValue!
        updown += Int(asc > 13 ? 26 - asc : asc)
        
        print("updown", updown)
        var endIndex = i+1
        while endIndex < name.count && name[endIndex] == "A" {
            endIndex += 1
        }
        
        let move = i * 2 + (name.count - endIndex)
        let moveBack = (name.count - endIndex) * 2 + i
        
        answer = min(answer, move)
        answer = min(answer, moveBack)
    }
    answer += updown
    
    return answer
}
solution("JEROEN")
solution("JAZ")
solution("JAN")
