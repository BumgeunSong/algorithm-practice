//
//  reverseKGroup.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/06.
//

import Foundation

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil || head?.next == nil || k == 1 { return head }
    
    let answer = ListNode(0)
    var p1 = answer
    var p2 = head
    
    while true {
        var p3 = p2
        for _ in 0..<k-1 {
            p3 = p3?.next
            if p3 == nil {
                p1.next = p2
                return answer.next
            }
        }
        
        p3 = p2?.next
        
        for _ in 0..<k {
            p2?.next = p1.next
            p1.next = p2
            p2 = p3
            p3 = p3?.next
        }
        
        for _ in 0..<k {
            p1 = p1.next!
        }
        
    }
}
