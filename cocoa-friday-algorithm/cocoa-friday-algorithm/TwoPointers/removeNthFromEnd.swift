//
//  removeNthFromEnd.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/07.
//

import Foundation

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if head == nil { return nil }
    
    var fast = head
    var slow = head
    
    var count = 0
    
    while fast != nil {
        if count > n { slow = slow?.next }
        count += 1
        fast = fast?.next
    }
    
    if count == n { return slow?.next }
    
    slow?.next = slow?.next?.next
    
    return head
}
