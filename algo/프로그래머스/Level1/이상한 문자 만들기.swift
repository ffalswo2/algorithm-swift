//
//  이상한 문자 만들기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12930
//  Created by 김민재 on 2022/08/16.
//

import Foundation

func solution(_ s:String) -> String {
    
    var arr = s.components(separatedBy: " ")
    
    for i in 0..<arr.count {
        var str = ""
        for (idx, char) in arr[i].enumerated() {
            if idx % 2 == 0 {
                str += char.uppercased()
            } else {
                str += char.lowercased()
            }
        }
        arr[i] = str
    }
    
    return arr.joined(separator: " ")
}


solution("tRy      hello  wOrld")
