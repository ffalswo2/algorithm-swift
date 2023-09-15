//
//  main.swift
//  algo
//
//  Created by 김민재 on 2023/09/16.
//

import Foundation


var nums = [10, 1, 7, 8, 5, 9, 2, 4, 6, 3]
nums = [1, 2, 3, 4, 5]

for i in 0..<nums.count-1 {
    var isSwap = false
    for j in 0..<nums.count-1-i {
        if nums[j] > nums[j+1] {
            nums.swapAt(j, j+1)
            isSwap = true
        }
    }
    if !isSwap { break }
}

print(nums)
