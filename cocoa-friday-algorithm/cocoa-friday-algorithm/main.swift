//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

print("Let's get algorithm tested")

var h1 = ListNode(3)
var h2 = ListNode(2)
var h3 = ListNode(0)
var h4 = ListNode(4)
h1.next = h2
h2.next = h3
h3.next = h4
h4.next = h2

let result = detectCycle(h1)
print(result?.val)
