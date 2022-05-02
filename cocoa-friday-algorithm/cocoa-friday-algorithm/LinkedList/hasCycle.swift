//
//  hasCycle.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/23.
//

import Foundation

// * Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil { return false }
    
    var fast = head
    var slow = head
    
    while fast?.next != nil && fast?.next?.next != nil {
        fast = fast?.next?.next!
        slow = slow?.next!
        
        if fast === slow { return true }
    }
    return false
}
