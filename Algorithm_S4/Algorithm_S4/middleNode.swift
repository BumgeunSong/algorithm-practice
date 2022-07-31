//
//  middleNode.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/31.
//

import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head
    
    while fast != nil, fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    return slow
}
