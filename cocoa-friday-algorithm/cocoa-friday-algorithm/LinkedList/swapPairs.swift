//
//  swapPairs.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/03.
//

import Foundation

func swapPairs(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }
    
    let answer: ListNode? = ListNode(0, head)
    
    var p1 = answer
    
    while let p2 = p1?.next, let p3 = p2.next {
        p2.next = p3.next
        p3.next = p2
        p1?.next = p3
        p1 = p2
    }
    
    return answer?.next
}
