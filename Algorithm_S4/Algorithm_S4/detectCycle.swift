//
//  detectCycle.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/31.
//

import Foundation

func detectCycle(_ head: ListNode?) -> ListNode? {
    var isVisited = [ObjectIdentifier: Bool]()
    var pointer = head
    
    while pointer != nil {
        if isVisited[ObjectIdentifier(pointer!)] != nil {
            return pointer!
        } else {
            isVisited[ObjectIdentifier(pointer!)] = true
            pointer = pointer!.next
        }
    }
    
    return nil
}
