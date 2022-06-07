//
//  AddTwoNumbers.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/06.
//

import Foundation

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    return add(l1, l2, carry: 0)
}

func add(_ l1: ListNode?, _ l2: ListNode?, carry: Int) -> ListNode? {
    if l1 == nil, l2 == nil {
        return carry == 1 ? ListNode(1) : nil
    }
    
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
    let (value, newCarry) = (sum % 10, sum / 10)
    let node = ListNode(value)
    node.next = add(l1?.next, l2?.next, carry: newCarry)
    return node
}



