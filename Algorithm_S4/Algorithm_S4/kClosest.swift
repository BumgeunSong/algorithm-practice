//
//  kClosest.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/01.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    if s.count <= 1 { return s.count }
    
    var start = 0
    var end = 0
    let sArr = Array(s)
    var set: Set<Character> = [sArr[start]]
    var maxLength = 0
    
    while end < sArr.count {
        if set.contains(sArr[end]) {
            set.remove(sArr[start])
            start += 1
        } else {
            set.insert(sArr[end])
            maxLength = max(maxLength, set.count)
            end += 1
        }
    }
    return maxLength
    
    // 투 포인터를 설정한다.
    // end 포인터의 값을 set에 넣는다.
    // 포인터를 하나 늘린다.
    // set에 end가 중복인지 확인한다.
    // 중복이면 start를 set에서 제거하고 start를 +1한다.
    // 다시 검사한다.
    // 중복이 아니면 end를 set에 추가하고, start-end 길이를 update한다.
}



