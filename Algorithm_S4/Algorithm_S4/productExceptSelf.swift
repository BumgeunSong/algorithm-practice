//
//  productExceptSelf.swift
//  Algorithm_S4
//
//  Created by 송범근 on 2022/08/04.
//

import Foundation
func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var lft = [1]
    var product = 1
    
    for num in nums {
        product *= num
        lft.append(product)
    }
    
    var rgt = [1]
    product = 1
    
    for num in nums.reversed() {
        product *= num
        rgt.append(product)
    }
    
    // 앞에 1을 붙여줌.
    lft.append(1)
    
    // 뒤에 1을 붙여줌.
    rgt.append(1)
    
    rgt.reverse()
    
    return (nums.indices).map { i in
        return lft[i] * rgt[i+2]
    }
    
}
