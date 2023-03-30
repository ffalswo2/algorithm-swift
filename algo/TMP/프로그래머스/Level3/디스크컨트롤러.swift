//
//  디스크 컨트롤러.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/42627
//  Created by 김민재 on 2022/09/18.
//

import Foundation


func solution(_ jobs:[[Int]]) -> Int {
    
    // removeLast 위해 반대로 정렬
    var works = jobs.sorted { lhs, rhs in
        if lhs[0] == rhs[0] { return lhs[1] > rhs[1] }
        else { return lhs[0] > rhs[0] }
    }
    
    var workQueue: [[Int]] = [works.removeLast()]
    
    var total = 0
    var endTime = workQueue.first![0]
    
    while !workQueue.isEmpty {
        let work = workQueue.removeLast()
        total += abs(endTime - work[0]) + work[1]
        endTime += work[1]
        
        while !works.isEmpty && works.last![0] <= endTime {
            workQueue.append(works.removeLast())
        }
        workQueue.sort(by: { $0[1] > $1[1] })
        
        if workQueue.isEmpty && !works.isEmpty {
            workQueue.append(works.removeLast())
            endTime += abs(endTime - workQueue.last![0])
        }
    }
    
    return total / jobs.count
}

solution([[0, 3], [1, 9], [2, 6]])
