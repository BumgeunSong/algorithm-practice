//
//  EditTable.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/02.
//

import Foundation

class ListNode {
    init(isOn: Bool = true, next: ListNode? = nil, prev: ListNode? = nil) {
        self.isOn = isOn
    }
    
    var isOn: Bool
    var next: ListNode?
    var prev: ListNode?
    
}

extension ListNode: CustomStringConvertible {
    var description: String {
        return isOn ? "O" : "X"
    }
}

class LinkedList {
    init(n: Int) {
        self.head = ListNode()
        self.pointer = head
        
        (1..<n).forEach { _ in
            pointer?.next = ListNode()
            pointer?.next?.prev = pointer
            pointer = pointer?.next
        }
    }
    
    let head: ListNode?
    var pointer: ListNode?
    var stack = [ListNode?]()
    
    func setPointer(to index: Int) {
        pointer = head
        moveDown(index)
    }
    
    func moveUp(_ index: Int) {
        for _ in 0..<index {
            pointer = pointer?.prev
        }
    }
    
    func moveDown(_ index: Int) {
        for _ in 0..<index {
            pointer = pointer?.next
        }
    }
    
    func delete() {
        pointer?.isOn = false
        stack.append(pointer)
        pointer?.prev?.next = pointer?.next
        pointer?.next?.prev = pointer?.prev
    }
    
    func cancel() {
        let toInsert = stack.removeLast()
        toInsert?.isOn = true
        toInsert?.prev?.next = toInsert
        toInsert?.next?.prev = toInsert
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        while !stack.isEmpty {
            let toInsert = stack.removeLast()
            toInsert?.prev?.next = toInsert
            toInsert?.next?.prev = toInsert
        }
        
        pointer = head
        var result = "\(pointer!)"
        while pointer?.next != nil {
            pointer = pointer?.next
            result += "\(pointer!)"
        }
        return result
    }
}


func editTable(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
    let list = LinkedList(n:n)
    list.setPointer(to: k)
    
    for cm in cmd {
        let cmArr = cm.components(separatedBy: " ")
        
        switch cmArr[0] {
        case "C": list.delete()
        case "U": list.moveUp(Int(cmArr[1])!)
        case "D": list.moveDown(Int(cmArr[1])!)
        case "Z": list.cancel()
        default: break
        }
    }
    return list.description
}





