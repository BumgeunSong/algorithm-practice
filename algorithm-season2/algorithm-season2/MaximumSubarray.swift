//
//  MaximumSubarray.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/03/18.
//

import Foundation

/*
 [문제]
 정수 배열이 주어진다.
 길이가 1 이상인, 연속된 부분 배열의 합중 최대값을 구하라.
 
 [풀이]
 연속된 부분 배열이니까, 정렬을 할 수는 없을 거 같다.
 
 연속된 부분 배열이니까 시작 포인터와 끝 포인터를 둔다.
 그런 다음 끝 포인터를 하나씩 이동시키면서 합의 최대값의 인덱스, 합의 최소값의 인덱스를 기록한다.
 
 와, 이게 생각보다 어렵네.
 
 시작 포인터 끝 포인터 만들고,
 합을 초기값 지정하고,
 끝 포인터 옮기면서 합 더하고, 최대값 기록
 시작 포인터 옮기면서 합에서 빼고, 최대값 기록
 */

struct Array {
    static func maxSubArray(_ nums: [Int]) -> Int {
        let diff = 0
        return diff
    }
}



