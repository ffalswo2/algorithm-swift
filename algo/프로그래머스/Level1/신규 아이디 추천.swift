//
//  신규 아이디 추천.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/72410?language=swift
//  Created by 김민재 on 2022/08/19.
//

import Foundation


func solution(_ new_id:String) -> String {
    /*
     1. 모든 대문자를 소문자로
     2. 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자 제거
     3. 마침표(.) 두번 연속된 부분 하나로 치환
     4. 처음이나 끝에 마침표(.) 있으면 제거
     5. new_id가 빈 문자열이면 ? new_id += "a"
     6. new_id > 15 ? new_id.prefix(15)
     6-1. 제거후에 맨 끝에 마침표(.) 있으면 끝에 있는 문자 제거
     7. new_id.count <= 2 ? new_id길이 3될때까지 마지막 문자 반복해서 끝에 붙이기
    */
    var result = ""
    
    // 2.
    for char in new_id.lowercased() {
        if char.isNumber || char.isLowercase || char == "-" || char == "_" || char == "." {
            result.append(char)
        }
    }
    
    // 3.
    while result.contains("..") {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    
    // 4.
    result = result.trimmingCharacters(in: ["."])
    
    // 5.
    if result.isEmpty {
        result.append("a")
    }
    
    if result.count > 15 {
        result = result.prefix(15).trimmingCharacters(in: ["."])
    } else if result.count <= 2 {
        result.append(String(repeating: result.last!, count: 3 - result.count))
    }
    
    
    return result
}



//solution("...!@BaT#*..y.abcdefghijklm")
//solution("z-+.^."    )
solution("=.="    )
//solution("123_.def"    )
//solution("abcdefghijklmn.p"    )
