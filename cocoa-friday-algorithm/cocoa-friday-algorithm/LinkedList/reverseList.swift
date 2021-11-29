//
//  reverseList.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

func reverseList(_ head: ListNode?) -> ListNode? {
    return recursion(head, nil)
}

func recursion(_ current: ListNode?, _ previous: ListNode?) -> ListNode? {
    if current == nil {return previous}
    
    let next = current!.next
    current!.next = previous
    
    return recursion(next, current)
}

