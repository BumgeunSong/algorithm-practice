//
//  ListNode.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/30.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    var values: [Int] {
        if next == nil { return [val] }
        return [val] + next!.values
    }
}

