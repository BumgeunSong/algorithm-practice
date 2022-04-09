//
//  todayhouse2.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/09.
//

import Foundation

public class LinkedListNode<T> {
  var value: T
  var next: LinkedListNode?

  public init(value: T) {
    self.value = value
  }
}

func solution(_ tString: String, _ variables: [[String]]) -> String {
    var dict = [String: LinkedListNode<String>]()
    
    let noTemplates = variables.filter { variable in
        (variable[1].first, variable[1].last) != (Character("{"), Character("}"))
    }
    
    
    let yesTemplates = variables.filter { variable in
        (variable[1].first, variable[1].last) == (Character("{"), Character("}"))
    }
    
    for variable in noTemplates {
        dict[variable[0]] = LinkedListNode(value: variable[0])
        dict[variable[1]] = LinkedListNode(value: variable[1])
        var newStr = String(variable[1].dropFirst().dropLast())
    }
    
    for variable in yesTemplates {
        let newNode = LinkedListNode(value: variable[0])
        
        if let nextNode = dict[variable[1]] {
            newNode.next = nextNode
        } else {
            newNode.next = LinkedListNode(value: variable[1])
        }
        
        dict[variable[0]] = newNode
    }
    
    
    
    tString.components(separatedBy: " ").map { word in
        if (word.first)
    }
    
    func hasCycle(_ head: LinkedListNode<String>) -> Bool {
        if head == nil { return false }
        
        var fast = head
        var slow = head
        
        while fast.next != nil && fast.next?.next != nil {
            fast = fast.next!.next!
            slow = slow.next!
            
            if fast === slow { return true }
        }
        
        return false
    }
    
    func getTailValue(_ head: LinkedListNode<String>) -> String {
        var pointer = head
        while let next = pointer.next {
            pointer = next
        }
        return pointer.value
    }
}
