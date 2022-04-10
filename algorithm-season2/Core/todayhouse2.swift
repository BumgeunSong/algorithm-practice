//
//  todayhouse2.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/09.
//

import Foundation

public class LinkedListNode {
  var value: String
  var next: LinkedListNode?

  public init(value: String) {
    self.value = value
  }
}

func isTemplate(_ string: String) -> Bool {
    return (string.first, string.last) == (Character("{"), Character("}"))
}

func unBracket(_ string: String) -> String {
    return String(string.dropFirst().dropLast())
}

func todayHouse2(_ tString: String, _ variables: [[String]]) -> String {
    var dict = [String: LinkedListNode]()
    var tempDict = [String: LinkedListNode]()
    
    let simple = variables.filter { !isTemplate($0[1]) }
    let linked = variables.filter { isTemplate($0[1]) }
    
    simple.forEach { variable in
        let newNode = LinkedListNode(value: variable[0])
        newNode.next = LinkedListNode(value: variable[1])
        dict[variable[0]] = newNode
    }
    
    func findNewNode(_ string: String) -> LinkedListNode {
        if let node = dict[string] { return node }
        else if let node = tempDict[string] { return node}
        return LinkedListNode(value: string)
    }
    
    func findNextNode(_ string: String) -> LinkedListNode {
        if let nextNode = dict[string] {
            return nextNode
        } else {
            let nextNode = LinkedListNode(value: string)
            tempDict[string] = nextNode
            return nextNode
        }
    }
 
    
    linked.forEach { variable in
        let newNode = findNewNode(variable[0])
        let nextNode = findNextNode(unBracket(variable[1]))
        
        newNode.next = nextNode
        dict[variable[0]] = newNode
    }
    
    
    let split = tString.components(separatedBy: " ").map { word -> String in
        guard isTemplate(word) else { return word }
        
        guard let list = dict[unBracket(word)] else { return word }
        
        if hasCycle(list) { return word }
        
        return getTailValue(list)
    }
    
    return split.joined(separator: " ")
}



func hasCycle(_ head: LinkedListNode) -> Bool {
    var fast = head
    var slow = head
    
    while fast.next != nil, fast.next?.next != nil {
        fast = fast.next!.next!
        slow = slow.next!
        if fast === slow { return true }
    }
    return false
}

func getTailValue(_ head: LinkedListNode) -> String {
    var pointer = head
    
    while let next = pointer.next {
        pointer = next
    }
    return pointer.value
}
