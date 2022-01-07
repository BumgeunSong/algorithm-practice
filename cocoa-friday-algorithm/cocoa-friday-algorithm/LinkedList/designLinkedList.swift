//
//  designLinkedList.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/04.
//

import Foundation

class MyLinkedList {
    
    var head: ListNode?
    var pointer: ListNode?
    
    init() {
        
    }
    
    func get(_ index: Int) -> Int {
        pointer = head
        for _ in 0..<index {
            pointer = pointer?.next
            if pointer == nil { return -1 }
        }
        return pointer?.val ?? -1
    }
    
    func addAtHead(_ val: Int) {
        pointer = ListNode(val, head)
        head = pointer
    }
    
    func addAtTail(_ val: Int) {
        
        if head == nil {
            head = ListNode(val)
            return
        }
        pointer = head
        while pointer?.next != nil {
            pointer = pointer?.next
        }
        let newnode = ListNode(val)
        pointer?.next = newnode
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        pointer = head
        
        if index == 0 {
            head = ListNode(val, pointer)
            return
        }
        
        for _ in 0..<index-1 {
            if pointer == nil { return }
            pointer = pointer?.next
        }
        pointer?.next = ListNode(val, pointer?.next)
    }
    
    func deleteAtIndex(_ index: Int) {
        pointer = head
        
        if index == 0 {
            head = pointer?.next
            return
        }
        
        for _ in 0..<index-1 {
            pointer = pointer?.next
            if pointer?.next == nil { return }
        }
        pointer?.next = pointer?.next?.next
    }
    
    func print() -> [Int] {
        var result = [Int]()
        pointer = head
        while pointer != nil {
            result.append(pointer!.val)
            pointer = pointer?.next
        }
        return result
    }
}


/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
