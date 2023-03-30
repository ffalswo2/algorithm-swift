//
//  시저 암호.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12926
//  Created by 김민재 on 2022/08/14.
//

import Foundation


func solution(_ s:String, _ n:Int) -> String {
    
    var result = ""
    for char in s {
        var ascii = char.asciiValue!
        switch ascii {
        case 65...90:
            ascii = (ascii + UInt8(n) - 65) % 26 + 65
        case 97...122:
            ascii = (ascii + UInt8(n) - 97) % 26 + 97
        default:
            break
        }
        
        result += String(UnicodeScalar(ascii))
    }
    
    return result
}

solution("a B z", 4)
