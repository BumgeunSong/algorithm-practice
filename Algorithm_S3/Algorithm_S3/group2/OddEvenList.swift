//
//  OddEvenList.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/06.
//

import Foundation

func oddEvenList(_ head: ListNode?) -> ListNode? {
    
    let oddHead: ListNode? = head
    let evenHead: ListNode? = head?.next
    
    var oddPointer = head
    var evenPointer = head?.next
    while oddPointer != nil {
        oddPointer?.next = oddPointer?.next?.next
        evenPointer?.next = evenPointer?.next?.next
        
        oddPointer = oddPointer?.next
        evenPointer = evenPointer?.next
    }
    
    var oddLast = oddHead
    while let next = oddLast?.next {
        oddLast = next
    }
    oddLast?.next = evenHead
    
    return oddHead
}
