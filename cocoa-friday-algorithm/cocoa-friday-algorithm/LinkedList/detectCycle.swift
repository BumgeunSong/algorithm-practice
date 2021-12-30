//
//  detectCycle.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/30.
//

import Foundation

func detectCycle(_ head: ListNode?) -> ListNode? {
    var p1 = getIntersect(head)
    if p1 == nil { return nil }
    
    var p2: ListNode? = head
    
    while p1 !== p2 {
        p1 = p1?.next
        p2 = p2?.next
    }
    
    return p1
}

func getIntersect(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return nil
    }
    
    var fast = head
    var slow = head
    
    while fast?.next != nil && fast?.next?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if fast === slow { return fast }
    }
    return nil
}
