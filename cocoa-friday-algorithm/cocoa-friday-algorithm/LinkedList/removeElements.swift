//
//  removeElements.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/23.
//

import Foundation

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let answer = ListNode(0, head)
    var current = answer.next
    var prev = answer
    
    while current != nil {
        if current?.val == val {
            prev.next = current?.next
            current = prev.next
        } else {
            current = current?.next
            prev = prev.next!
        }
    }
    return answer.next
}
