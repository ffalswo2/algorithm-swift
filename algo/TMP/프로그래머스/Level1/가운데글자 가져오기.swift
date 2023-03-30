//
//  가운데 글자 가져오기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/12903
//  Created by 김민재 on 2022/08/11.
//

import Foundation

func solution(_ s:String) -> String {
    let cnt = s.count
    var answer = ""
    if cnt % 2 == 0 {
        answer = String(s[s.index(s.startIndex, offsetBy: s.count / 2 - 1)...s.index(s.startIndex, offsetBy: s.count / 2)])
    } else {
        answer = String(s[s.index(s.startIndex, offsetBy: s.count / 2)])
    }
    
    return answer
}

/*
Swift에서는 문자열에 접근하는게 어려우니 문자열을 Array로 변환해서 많이 사용한다
문자열을 Array로 바꾸면 파이썬처럼 []의 인덱스로 문자열을 접근할 수 있기 때문에 훨씬 용이하다.
*/

func betterSolution(_ s:String) -> String {
    let arr = Array(s)
    let cnt = arr.count
    
    if cnt % 2 == 0 {
        return String(arr[cnt / 2 - 1...cnt / 2])
    } else {
        return String(arr[cnt / 2])
    }
}


betterSolution("abcde")
betterSolution("qwer")
