//
//  trainingSuit.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/17.
//

import Foundation

func trainingSuit(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var lostSet = Set(lost).subtracting(reserve)
    let reserveSet = Set(reserve).subtracting(lost)
    
    for reserve in reserveSet {
        
        if reserve > 1, lostSet.contains(reserve - 1) {
            // 내 앞 번호 학생이 체육복이 없는지 확인
            lostSet.remove(reserve - 1)
        } else if reserve < n, lostSet.contains(reserve + 1) {      // 내 뒷 번호 학생이 체육복이 없는지 확인
            lostSet.remove(reserve + 1)
        }
    }
    
    return (n - lostSet.count)
}

