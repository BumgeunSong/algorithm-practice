//
//  reverseList.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/30.
//

import Foundation

func reverseList(_ head: ListNode?) -> ListNode? {
    return reverse(nil, head)
}

func reverse(_ prev: ListNode?, _ current: ListNode?) -> ListNode? {
    if current == nil { return prev }
    
    let next = current!.next
    current?.next = prev
    
    return reverse(current, next)
}
