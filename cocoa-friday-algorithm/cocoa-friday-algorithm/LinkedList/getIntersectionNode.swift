//
//  getIntersectionNode.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/31.
//

import Foundation

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var a = headA, b = headB
    
    while a !== b {
        a = a == nil ? headB : a?.next
        b = b == nil ? headA : b?.next
    }
    
    return a
}
