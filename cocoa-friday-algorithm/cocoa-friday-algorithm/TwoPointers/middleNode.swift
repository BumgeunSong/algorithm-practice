//
//  middleNode.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/07.
//

import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    
    var fast = head
    var slow = head
    
    while fast?.next != nil {
        fast = fast!.next!.next
        slow = slow?.next
    }
    return slow
}
