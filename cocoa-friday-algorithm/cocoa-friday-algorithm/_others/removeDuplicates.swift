//
//  removeDuplicates.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var p1 = head
    while let p2 = p1?.next  {
        if p1!.val == p2.val {
            p1?.next = p2.next
            
        } else {
            p1 = p1?.next
        }
    }
    return head
}
