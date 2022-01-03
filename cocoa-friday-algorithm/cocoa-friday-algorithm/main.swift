//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

print("Let's get algorithm tested")

var h1 = ListNode(1)
var h2 = ListNode(2)
var h3 = ListNode(3)
var h4 = ListNode(4)
h4.next = nil
h3.next = h4
h2.next = h3
h1.next = h2

let result = swapPairs(h1)

func printLinkedList(_ head: ListNode?) {
    var current = head
    while current != nil {
        print(current?.val)
        current = current?.next
    }
}

printLinkedList(result)
