//
//  키패드 누르기.swift
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/67256
//  Created by 김민재 on 2022/08/07.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    let star = -1
    let shap = -2

    let board = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [star, 0 , shap]
    ]
    
    let directions = [
        (-1,0),
        (1,0),
        (0,-1),
        (0,1)
    ]
    
    func getXY(num: Int) -> (Int, Int) {
        switch num {
        case 1...3:
            return (0, num-1)
        case 4...6:
            return (1, (num-1) % 3)
        case 7...9:
            return (2, (num-1) % 3)
        default:
            if num == star {
                return (3, 0)
            } else if num == shap {
                return (3, 2)
            } else {
                return (3, 1)
            }
        }
    }
    
    
    let leftSide = Set<Int>([1, 4, 7])
    let rightSide = Set<Int>([3, 6, 9])
    
    var left = star
    var right = shap
    
    var result = ""
    for num in numbers {
        
        if leftSide.contains(num) {
            result.append("L")
            left = num
        } else if rightSide.contains(num) {
            result.append("R")
            right = num
        } else {
            let (targetY, targetX) = getXY(num: num)
            let (leftY, leftX) = getXY(num: left)
            let (rightY, rightX) = getXY(num: right)
            
            let leftDist = abs(targetY - leftY) + abs(targetX - leftX)
            let rightDist = abs(targetY - rightY) + abs(targetX - rightX)
            
            if leftDist < rightDist {
                result.append("L")
                left = num
            } else if rightDist < leftDist {
                result.append("R")
                right = num
            } else {
                let t = hand == "right" ? "R" : "L"
                
                if t == "R" {
                    right = num
                } else {
                    left = num
                }
                result.append(t)
                
            }
        }
    }
    
    return result
}

solution([0, 0], "right")





