//
//  AddTwoNumbers.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/29.
//

import Foundation

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let answer: ListNode? = ListNode(0)
    
    var p1 = l1, p2 = l2, p3 = answer
    var carry = 0
    
    while p1 != nil && p2 != nil {
        let sum = p1!.val + p2!.val + carry
        p3?.next = ListNode(sum % 10)
        carry = sum / 10
        
        p1 = p1?.next
        p2 = p2?.next
        p3 = p3?.next
    }
    
    while p1 == nil && p2 != nil {
        let sum = p2!.val + carry
        p3?.next = ListNode(sum % 10)
        carry = sum / 10
        p2 = p2?.next
        p3 = p3?.next
    }
    
    while p2 == nil && p1 != nil {
        let sum = p1!.val + carry
        p3?.next = ListNode(sum % 10)
        carry = sum / 10
        p1 = p1?.next
        p3 = p3?.next
    }
    
    if p1 == nil && p2 == nil && carry == 1 {
        p3?.next = ListNode(1)
    }
    
    return answer?.next
}
