//
//  완주하지못한선수(Python).swift
//  algo
//
//  Created by 김민재 on 2022/09/18.
//
//MARK: Python
from collections import Counter


def solution(participant, completion):
    counter = Counter(participant) - Counter(completion)
    return list(counter.keys())[0]


solution(["marina", "josipa", "nikola", "vinko", "filipa"],
         ["josipa", "filipa", "marina", "nikola"])
solution(["mislav", "stanko", "mislav", "ana"],["stanko", "ana", "mislav"])

/*
 from collections import defaultdict


 def solution(participant, completion):
     answer = ''

     d = defaultdict(int)
     for p in participant:
         d[p] += 1

     for c in completion:
         d[c] -= 1

     for i in d:
         if d[i] > 0:
             answer += i
     return answer
 */
