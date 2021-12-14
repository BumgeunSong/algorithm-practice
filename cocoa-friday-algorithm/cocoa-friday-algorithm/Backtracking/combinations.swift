//
//  combinations.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/12.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    // 뽑을 재료의 배열을 받아 처리하는 helper 함수와
    // 파라미터 n을 뽑을 재료의 배열로 변환하는 Array(1...n) 조합.
    // 어차피 nums는 어차피 배열이기 때문에 재료가 없는 빈 배열이 들어오면 그냥 반복문 발생 안하고 빈 배열을 return 한다.
    
    func backtrack(_ nums: [Int], _ k: Int) -> [[Int]] { // 재료들의 배열을 받아서 조합을 return 하는 함수.
        if k == 1 {  return nums.map { [$0] } }
        
        var answer = [[Int]]()
        for num in nums {
            let lessThanNum = Array(1..<num)
            backtrack(lessThanNum, k-1).forEach { answer.append($0 + [num]) }
        }
        return answer
    }
    
    return backtrack(Array(1...n), 2) // 파라미터 n을 재료의 배열로 바꾸는 함수.
}


func combine2(_ n: Int, _ k: Int) -> [[Int]] {
    // 파라미터 n을 그대로 받아서, 함수 내부에서 재료 배열을 생성한 뒤 조합을 return 하는 함수.
    // 그냥 nums에 반복문을 돌면, nums 안에 k보다 작은 수가 포함되어있다.
    // n이 k보다 작으면 에러가 발생한다. 왜냐하면 k가 1이 될 때까지 재귀를 타야하는데, 그 전에 nums이 0 이하가 되어버리기 때문.
    // k가 1이 되었을 때 1...n 범위가 error를 일으키게 된다.
    // 따라서 n은 항상 k보다 크거나 같은 상태에서 재귀 순환을 시작해야 한다.
    // 이 함수에서는 k...n 범위를 사용해 반복을 돌려서 해당 문제를 해결한다.
    
    if k == 1 {
        return Array(1...n).map { [$0] }
    }
    
    return Array(k...n).reduce(into: [[Int]]()) { partialResult, num in
        combine2(num - 1, k - 1).forEach {
            partialResult.append($0 + [num])
        }
    }
}
