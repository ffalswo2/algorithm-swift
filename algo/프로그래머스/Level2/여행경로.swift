//
//  여행경로.swift
//  algo
//
//  Created by 김민재 on 2023/09/13.
//


import Foundation

func solution(_ tickets:[[String]]) -> [String] {

    var tickets: [[String]] = tickets.sorted { a, b in
                                              a[1] < b[1]

    }


    var ticketUsed = Array(repeating: false, count: tickets.count)


    var path: [String] = ["ICN"]

    func dfs(_ start: String) {

        if path.count == tickets.count + 1 {
            return
        }

        for i in 0..<tickets.count {
            if !ticketUsed[i] && tickets[i][0] == start {
                ticketUsed[i] = true // ticket used !
                let ticket = tickets[i]
                path.append(ticket[1])

                dfs(ticket[1])
                if path.count == tickets.count + 1 {
                    return
                }

                path.removeLast()
                ticketUsed[i] = false // bt
            }
        }
    }

    dfs("ICN")


    return path
}

solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]    )
