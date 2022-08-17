//
//  핸드폰 번호 가리기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12948
//  Created by 김민재 on 2022/08/18.
//

import Foundation


func solution(_ phone_number:String) -> String {
    var ph = phone_number
    ph.replaceSubrange(phone_number.startIndex..<phone_number.index(phone_number.startIndex, offsetBy: phone_number.count - 4), with: String(repeating: "*", count: phone_number.count - 4))
    
    return ph
}

func sol2(_ phone_number: String) -> String {
    return "\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))"
}


print(sol2("01033334444"))
print(sol2("027778888"))
print(sol2("4444"))
