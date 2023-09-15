//
//  뉴스 클러스터링.swift
//  algo
//
//  Created by 김민재 on 2023/09/16.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {

    var str1 = Array(str1.uppercased())
    var str2 = Array(str2.uppercased())

    func makeDict(_ str: [Character]) -> [String: Int] {
        var dict: [String: Int] = [:]
        for i in 0..<str.count-1 {
            let a = str[i...i+1].map { String($0) }
            if !str[i+1].isLetter || !str[i].isLetter {
                continue
            }
            let b = a.joined(separator: "")
            dict[b, default: 0] += 1
        }
        return dict
    }

    var str1Dict = makeDict(str1)
    var str2Dict = makeDict(str2)
    // print(str2Dict.keys) // ["RE", "CH", "NC", "EN", "FR"]

    var inter = 0
    var union = 0

    for item in str1Dict { //     (key: "FR", value: 1)
        let key = item.0
        let count = item.1
        if str2Dict.keys.contains(key) {
            inter += min(count, str2Dict[key]!)
            union += max(count, str2Dict[key]!)
        }
        else {
            union += count
        }
    }

    for item in str2Dict { //     (key: "FR", value: 1)
        let key = item.0
        let count = item.1
        if str1Dict.keys.contains(key) {
            continue
        }
        union += count
    }

    if union == 0 && inter == 0 {
        return 65536
    }

    let answer = Int(Float(inter) / Float(union) * 65536)
    print(answer)

    return answer
}

