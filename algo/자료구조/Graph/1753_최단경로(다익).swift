//
//  1753_최단경로(다익).swift
//  algo
//
//  Created by 김민재 on 2023/08/24.
//

import Foundation

struct PathWeight {
    let to: Int
    let weight: Int
}

final class Heap {
    private var elements: [PathWeight] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    func insert(_ pw: PathWeight) {
        elements.append(pw)
        siftUp(start: elements.count - 1)
    }

    func removeFirst() -> PathWeight? {
        elements.swapAt(0, elements.count - 1)
        let rev = elements.popLast()
        siftDown(start: 0)
        return rev
    }

    func parent(of r: Int) -> Int {
        return (r - 1) / 2
    }

    func leftChildIndex(of r: Int) -> Int {
        return 2 * r + 1
    }

    func rightChildIndex(of r: Int) -> Int {
        return 2 * r + 2
    }

    private func siftUp(start: Int) {
        let parentIndex = parent(of: start)
        if parentIndex < 0 { return }

        if elements[parentIndex].weight > elements[start].weight {
            elements.swapAt(parentIndex, start)
            siftUp(start: parentIndex)
        }
    }

    private func siftDown(start: Int) {
        let leftChildIdx = leftChildIndex(of: start)
        let rightChildIdx = leftChildIdx + 1

        guard let chosen = getMinNode(left: leftChildIdx, right: rightChildIdx) else {
            return
        }

        if elements[chosen].weight < elements[start].weight {
            elements.swapAt(chosen, start)
            siftDown(start: chosen)
        }
    }

    private func getMinNode(left: Int, right: Int) -> Int? {
        let n = elements.count

        if left >= n && right >= n { return nil }
        else if left >= n { return right }
        else if right >= n { return left }

        if elements[left].weight < elements[right].weight {
            return left
        } else {
            return right
        }
    }




}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let V = input[0] // 1...V까지 번호가 매겨져있음
let E = input[1]
let S = Int(readLine()!)! // 시작 정점 번호




// (정점 번호, 가중치)
var adjList: [[PathWeight]] = Array(repeating: [], count: V + 1)

for _ in 0..<E {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let w = input[2]

    let vw = PathWeight(to: v, weight: w)

    adjList[u].append(vw)
}


var dist: [Int] = Array(repeating: Int.max, count: V + 1)
var visited = Array(repeating: false, count: V + 1)

dist[S] = 0
visited[S] = true

var heap = Heap()
heap.insert(PathWeight(to: S, weight: 0))

while !heap.isEmpty {
    if let u = heap.removeFirst()?.to {
//        if visited[u] { continue }

        visited[u] = true

        for v in adjList[u] {
            if !visited[v.to] && dist[v.to] > v.weight + dist[u] {
                dist[v.to] = v.weight + dist[u]
                heap.insert(PathWeight(to: v.to, weight: dist[v.to]))
            }
        }
    }

}

for d in dist[1...] {
    if d == Int.max {
        print("INF")
    } else {
        print(d)
    }
}
