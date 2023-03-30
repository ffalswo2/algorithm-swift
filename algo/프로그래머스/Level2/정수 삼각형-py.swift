//
//  정수 삼각형.py
//  algo
//  https://school.programmers.co.kr/learn/courses/30/lessons/43105
//  Created by 김민재 on 2022/09/09.
//


//MARK: 파이썬으로 풀었어요

def solution(triangle):
    for i in range(1, len(triangle)):
        for j in range(len(triangle[i])):
            # 모서리 처음
            if j == 0:
                triangle[i][j] += triangle[i-1][j]
            # 모서리 끝
            elif j == len(triangle[i]) - 1:
                triangle[i][j] += triangle[i-1][j-1]
            else:
                triangle[i][j] += max(triangle[i-1][j-1], triangle[i-1][j])

    return max(triangle[-1])

solution([[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]])
