//
//  부족한 금액 계산하기.swift
//  algo
//
//  Created by 김민재 on 2022/08/10.
//

import Foundation


func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var fee = 0
    for i in 1...count {
        fee += price * i
    }
    return fee <= money ? 0 : Int64(abs(fee - money))
}

solution(3, 20, 4)
