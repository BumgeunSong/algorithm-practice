//
//  나누어 떨어지는 숫자 배열.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/12.
//

// Link: https://programmers.co.kr/learn/courses/30/lessons/12910
// array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.
// divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var answer: [Int] = []
    
    for n in arr {
        if n % divisor == 0 {
            answer.append(n)
        }
    }
    
    if answer.isEmpty {
        answer.append(-1)
    }
    
    answer.sort()
    
    return answer
}
